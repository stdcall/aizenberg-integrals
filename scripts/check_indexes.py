"""Check the subject index marks, `#idx(..path)`, placed in the text.

A mark is `metadata((kind: "index-mark", path: ("Element", "nilpotent")))`:
the path of the entry in the index of the book, heading first. The page
numbers come from where the marks stand, so there is nothing to compare with
the printed index; what remains is what free-text marks get wrong on their
own. An older single-term form (`term`, optional `sub`) is still read, so a
change of the helper's signature does not silently empty the index.
"""
from collections import Counter, defaultdict
import re

import pymupdf


def check_index_spacing(pdf, bookmarks):
    """Catch packed index lines in the PDF, including wrapped entries."""
    index_page = next((b['pdf_page'] for b in bookmarks
                       if b['title'] == 'Index'), None)
    if index_page is None:
        return
    with pymupdf.open(pdf) as document:
        for page in document[index_page - 1:]:
            spans = [s for s in page.get_texttrace()
                     if 'LibertinusSerif' in s['font'] and s['chars']]
            sizes = Counter()
            for span in spans:
                sizes[round(span['size'], 2)] += len(span['chars'])
            if not sizes:
                continue
            size = sizes.most_common(1)[0][0]
            for right in (False, True):
                baselines = sorted(
                    y for span in spans if abs(span['size'] - size) < 0.1
                    for _, _, (x, y), _ in span['chars']
                    if (x >= page.rect.width / 2) == right
                )
                previous = None
                for y in baselines:
                    if previous is not None:
                        gap = y - previous
                        if gap <= 1.5:
                            continue
                        if gap < size:
                            raise SystemExit(
                                f'Index page {page.number + 1}: adjacent '
                                f'baselines are {gap:.1f} pt apart '
                                f'for {size:g} pt text')
                    previous = y


def marks(metadata):
    for item in metadata:
        value = item.get('value', item)
        if isinstance(value, dict) and value.get('kind') == 'index-mark':
            yield value, item.get('position') or value.get('position')


def entry_path(value):
    path = value.get('path')
    if path is None and 'term' in value:
        sub = value.get('sub')
        path = [value['term']] + (sub if isinstance(sub, list)
                                  else [sub] if sub else [])
    return path


def spelling_key(level):
    return ' '.join(level.split()).casefold()


def index_checks(metadata, *, final=True, labels=None):
    """Errors and warnings of the marks; an empty index is an error only in
    the finished book."""
    errors, warnings = [], []
    forms = defaultdict(set)
    links = defaultdict(set)
    paths = set()
    count = 0
    for value, position in marks(metadata):
        where = f' (PDF page {position["page"]})' if position else ''
        path = entry_path(value)
        if isinstance(path, str):
            path = [path]
        if not isinstance(path, list) or not path:
            errors.append('an index mark carries no path' + where)
            continue
        if not all(isinstance(level, str) and level.strip() for level in path):
            errors.append(f'index path {path!r} has an empty level' + where)
            continue
        if any(level != level.strip() or re.search(r'\s{2,}', level)
               for level in path):
            errors.append(f'index path {path!r} has stray whitespace' + where)
        count += 1
        paths.add(tuple(path))
        target = value.get('target')
        if labels is not None and target and target.strip('<>') not in labels:
            (errors if final else warnings).append(
                f'index entry {path!r} has no target {target}' + where)
        for key in ('see', 'also'):
            if value.get(key):
                links[tuple(path)].add(value[key])
        # A typo in a mark fails nothing by itself: it quietly splits one
        # entry into two that sort next to each other. Catch the near-miss
        # at every level of the path.
        for depth in range(1, len(path) + 1):
            prefix = tuple(path[:depth])
            forms[tuple(spelling_key(p) for p in prefix)].add(prefix)
    if not count:
        (errors if final else warnings).append(
            'the index is empty: no #idx marks in the text')
    for path, cross_references in links.items():
        for target in sorted(cross_references):
            # A head printed only with subentries ("unipotent", with "— over
            # fields") is a target too.
            # "see also locally soluble/supersoluble/nilpotent groups" names
            # several entries at once and is printed as it stands.
            # The same readings of a cross-reference as content/index-style:
            # a head, the first word of a head, or that word and a subentry;
            # a head and a subentry, or the first words of the subentry.
            def names(path):
                word = path[0].split(' ')[0]
                return {path[0], word} | (
                    {word + ' ' + path[1], path[0] + ', ' + path[1]}
                    if len(path) > 1 else set())

            def matches(target, path):
                head, _, sub = target.partition(', ')
                return target in names(path) or (
                    len(path) > 1 and sub and head == path[0]
                    and path[1].startswith(sub + ' '))
            if '/' not in target and not any(matches(target, path)
                                             for path in paths):
                (errors if final else warnings).append(
                    f'index entry {path!r} refers to missing entry {target!r}')
    reported = set()
    for key, spellings in sorted(forms.items(), key=lambda kv: len(kv[0])):
        if len(spellings) < 2 or any(key[:d] in reported
                                     for d in range(1, len(key))):
            continue
        reported.add(key)
        errors.append('one index entry spelled several ways: '
                      + ', '.join(' / '.join(s) for s in sorted(spellings)))
    return errors, warnings
