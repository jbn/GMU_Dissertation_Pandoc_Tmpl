
This README file provides necessary information on the GMU PhD LaTeX dissertation
style template release designed by Daniel O. Awduche and Christopher A. St. Jean
of GMU's Communications and Networking Lab.

%%**********************************************************************
%% Legal Notice:
%% This code is offered as-is without any warranty either
%% expressed or implied; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE!
%% User assumes all risk.
%% In no event shall any contributor to this code be liable for any damages
%% or losses, including, but not limited to, incidental, consequential, or
%% any other damages, resulting from the use or misuse of any information
%% contained here.
%%**********************************************************************

The release of code was designed to be an easy "plug and play" solution for generating
approved PhD dissertation documents.  The user should modify those and only those
portions of the template that are indicated to be user-specific.  Modifying other
areas of the template or the LaTeX style file itself is done at the user's peril.
The user is also urged, in the strongest terms, to follow the compilation and
printing guidelines included in the accompanying usage notes (USAGE_NOTES.txt);
the margins of LaTeX-generated documents are notoriously testy, and the instructions
need to be followed in order to guarantee proper formatting.

This template was created using WinEdt™, a high-quality shareware TeX editor, but any
LaTeX editor may be used.  (WinEdt™ can be found at www.winedt.com.)  Happy LaTeXing!

% Revision information
$Id: README.txt,v 1.6 2007/08/12 04:21:22 Owner Exp $

-------

In addition to this README.txt file, this release of the GMU PhD LaTeX dissertation
style template contains the following 12 files:

(1) USAGE_NOTES.txt

    A collection of utterly ESSENTIAL notes on using this template.  Start here!

(2) GMU_dissertation_template.tex

    The main LaTeX file template that will be modified by the user.

(3) gmudissertation.sty

    The LaTeX style file that needs to be included unmodified in the working
    directory of the user's LaTeX project

(4) mydissertationabbrev.sty

    Contains any and all user-specific commands/definitions/redefinitions that the
    user would like to include.  Sample commands are included in the file.

(5) chapterOne.tex

    A sample first chapter  (The sample text is from George Mason himself.)

(6) chapterTwo.tex

    A sample second chapter

(7) Appendix.tex

    A sample appendix.  Note that the chapter-like command for appendices is
    "appchapter" instead of the usual "chapter" because of a page numbering
    difference.

(8) bibfile.bib

    A sample BibTeX bibliography file.  The user is urged to consider using BibTeX,
    but if he/she does not, then this file, IEEEtran.bst, IEEEfull.bib, and the
    associated BibTeX commands in GMU_dissertation_template.tex (i.e.,
    \bibliographystyle and \bibliography) may be ignored.

(9) IEEEtran.bst

    The IEEE's official bibliography style file.  Of course, any standard .bst
    file may be used, but this file is ideally suited to electrical and computer
    engineering dissertations.  Although the edition of this file provided is the
    most recent, the official location of this file, which should be consulted
    for updates, is:

        www.ctan.org/tex-archive/biblio/bibtex/contrib/IEEEtran/

    The user is encouraged to use the .bst file that may be most appropriate for
    his/her field, if such a file is available.

(10) IEEEfull.bib

    Provides template abbreviations for IEEE journals and magazines and
    is designed to work with IEEEtran.bst

(11) figGeorgeMason.eps

    A sample .eps figure of someone important

(12) GMU_dissertation_template_output.pdf

    The output .pdf file of this template (to be used for comparison to one's own
    compilation)

----------------

Please note that although every effort has been made to conform this
template to official GMU thesis guidelines, there is no expressed or implied
warranty that the produced results will be satisfactory.
