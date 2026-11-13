"""Inserting a statement renumbers the statements and their references;
formulas, points and examples keep their own series per section; sections
are numbered through the book (a chapter does not restart them); the
Preliminaries are section 0."""
from pathlib import Path
import subprocess
import tempfile
import unittest

import fitz

ROOT = Path(__file__).resolve().parents[2]
SOURCE = """#import "/content/book-style.typ": book-style
#import "/content/main-defs.typ": tagged-equation
#import "/content/statements.typ": *
#show: book-style
#heading(numbering: none)[Preliminaries] <front:preliminaries>
#corollary[A corollary.] <cor:zero>
$ s = t $ <eq:zero>
= First Chapter <ch:first>
== First Section <sec:first>
#theorem[#point <pt:first> A theorem.] <th:first>
== Second Section <sec:second>
{insertion}
#lemma[The target statement.] <lem:target>

#point <pt:second> Text $ x = y $ <eq:first> and $ z = w $ and
$ u = v $ <eq:second>
#tagged-equation([$*$], $ p = q $) <eq:star>

#eg[An example.] <exm:first>

Compare @lem:target, @eq:first, @eq:second, @eq:star, @th:first,
@sec:second, @pt:second, Example~@exm:first, @cor:zero, @eq:zero.

= Second Chapter <ch:second>
== A Section <sec:third>
#lemma[Another lemma.] <lem:third>

Back to @lem:target and @eq:second, @sec:third, Lemma~@lem:third.
"""


class StatementNumbering(unittest.TestCase):
    def compile(self, text):
        with tempfile.TemporaryDirectory(prefix='ai-numbering-',
                                         dir='/tmp') as tmp:
            output = Path(tmp) / 'sample.pdf'
            result = subprocess.run([
                'typst', 'compile', '--root', str(ROOT),
                '--ignore-system-fonts', '--font-path',
                str(ROOT / 'assets/fonts'), '--input', 'stage=draft', '-',
                str(output),
            ], input=text, text=True, capture_output=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(result.stderr, '')
            with fitz.open(output) as pdf:
                text = ' '.join(' '.join(p.get_text().split()) for p in pdf)
                links = [link for page in pdf for link in page.get_links()
                         if link.get('kind') == fitz.LINK_GOTO]
                return text, links

    def test_insertion_renumbers_statements_only(self):
        before, links = self.compile(SOURCE.format(insertion=''))
        self.assertIn('Corollary 0.1.', before)
        self.assertIn('§1. First Section', before)
        self.assertIn('1°. Theorem 1.1.', before)
        self.assertIn('Lemma 2.1.', before)
        self.assertIn('Example 1.', before)
        self.assertIn('Compare 2.1, (2.1), (2.2), (∗), 1.1, §2, 1°, '
                      'Example 1, 0.1, (0.1).', before)
        # The second chapter goes on with the sections of the book.
        self.assertIn('§8. A Section', before)
        self.assertIn('Lemma 8.1.', before)
        self.assertIn('Back to 2.1 and (2.2), §8, Lemma 8.1.', before)
        self.assertGreaterEqual(len(links), 12)
        after, _ = self.compile(SOURCE.format(
            insertion='#theorem[An inserted theorem.] <th:inserted>'))
        self.assertIn('Theorem 2.1.', after)
        self.assertIn('Lemma 2.2.', after)
        self.assertIn('Compare 2.2, (2.1), (2.2), (∗), 1.1, §2, 1°, '
                      'Example 1, 0.1, (0.1).', after)
        self.assertIn('Back to 2.2 and (2.2), §8, Lemma 8.1.', after)


if __name__ == '__main__':
    unittest.main()
