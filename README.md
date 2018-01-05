# Background and Motivation

[Daniel O Awduche](http://www.awduche.com/) and Christopher A St Jean built a [LaTeX template for writing a GMU thesis](http://thesis.gmu.edu/templates.html). [Muhammad Abdulla](http://cs.gmu.edu/~mabdulla/) modified it a bit, too. Looking at the CVS revisions, the last modification occured back in 2008. Given the speed of LaTeX evolution, that's fine. However, in terms of workflow, I'd like to write in Pandoc-flavored markdown. That's true in general, but almost doubly so for my thesis. I'll never share the mandated typeset with anyone but the library. Everyone else will get a document that targets modern screens rather than dot matrix printer.

In terms of design, I favored pandoc's template language (`template/gmu_thesis.tex`) over writing LaTeX code. LaTeX's noise makes LISP feel like pure signal. (Well, that, plus I don't have much LaTeX macro-writing experience, and I'm strapped for time.) I'll try to keep future updates as unobtrusive as possible. 

# TODO

(*I'm putting this section here, hoping a user will commit these changes. :wink: :wink:*)

Please see [the issues](https://github.com/jbn/GMU_Dissertation_Pandoc_Tmpl/issues).


# Usage

To build the collection of facts and figures that is your dissertation, 

```sh
docker run \
    -e CONTENT=chapters/example.md \
    -e EXTRAS="--template=/gmu/template/gmu_thesis.tex" \
    -e APPENDICES=--include-after-body=appendices/appendix.md \
    -v `pwd`:/src --rm -it generativist/gmu_pandoc_phd:latest
```


Your details (e.g. name, school) mostly go in `meta.yaml`. But, there are some caveats and things that need elaboration. I'll get to that soon.

## Where is my PDF?

It's in the `target` folder. You can change this and the document's name in the `Makefile`. Set `OUTPUT_NAME` and `OUTPUT_DIR` to whatever you want. 

## What is Draft Mode?

When you build your thesis, the front page isn't UDTS approved. Instead, it disclaims any responsibility for the content, by making it clear it is a draft. The ridiculously overwhelming majority of your time will be in draft mode. So, this is the default. 

The draft page -- besides noting it is not for distribution -- captures the build (i.e. `make`) time of the PDF. It also captures the short hex of your current `git` commit. I assume the overlap between people wanting to use `pandoc` and people who use `git` is high. But, your committee may not use git. Still, it's useful and I use it for every paper/project, so...it's there.  

## Where is my correct signature page?

Delightfully, each school uses a different signature page. Sometimes the differences are subtle, which makes it super fun. Unfortunately, I care about my time, so I only included the signature page relevant to me (CSS Ph.D). However, I'm hoping this repository will glob up other people's efforts. If you write a sig page for your degree, please for this and add it to `template/sigs`. As a naming convention, please don't use underscores. (It screws up latex input. Underscores are meaningful. Alternatively, fix this bug.) 

To change the signature page, set the file path relative to root in `meta.yaml`. It is in the `signature_page` field. You probably want to copy it from `template/sigs/<sigpage>.tex` to `template/your_sig.tex`.

**You have to edit this file manually**. (Long story.)

## How do I write my abstract, dedication, etc?

I consider the abstract, acknowledgements, dedication, and CV to be academic ornaments. They are part of an envelope that wraps the stuff that actually matters. Hence, the `.tex` files are in `template/envelope`. Edit those. 

They are in plain `.tex` because I couldn't find an `include()` mechanism in pandoc. If there is an $include$ -- and, if it does src to dest format translation -- please ping me!

## How do I do a two page abstract?

Keep `two_page_abstract` set to `true` in `meta.yaml`. Write the first part in `template/envelope/abstract.tex` and the second in `template/envelope/abstract_cont.tex`. This follows a convention set by the prior LaTeX template. From their `USAGE.txt` file,

> Currently, the template file (GMU_dissertation_template.tex) includes on line 139 the
> optional command "\abstractmultiplepage" to create a second page for the abstract.
> It has become clear, however, that if this option is not selected, the page numbering
> scheme is disrupted.  Specifically, in the Table of Contents, the page number is listed
> as "0" instead of the appropriate Roman numeral (usually "viii").
> 
> A permanent solution for this problem is forthcoming, and this problem is rightly
> referred to as a "known issue."  As currently coded, therefore, it is *strongly*
> recommended that the abstract extend to the second page, if at all possible.
> (I would suspect that the abstract would occupy both pages in the majority of
> dissertations anyhow.)

The abstract page header fields takes a good chunk of real estate, so you probably do have a two page abstract. This is a bad solution that needs something better. 

## Where does my content go?

Actually, anywhere you want. Automatically though, your chapters go in `chapters` and should end with `.md`. The appendices go in `appendices` and should end with `.md`. To add more appendices, edit your `Makefile` to include each one in the `APPENDICES` variable. 

You can change any of this by editing the `APPENDICES` or `CONTENT` variables in the `Makefile`.

## How can I customize the template?

Where possible, edit `gmu_thesis_user_prefs.sty`. That's what this file is for. The template also conforms to `--include-in-header=<FILE>` and `--include-before-body=<FILE>` arguments to `pandoc`, so you can edit the `Makefile`. Prefer these methods to editing `template/gmu_thesis.tex`. 

The `--include-after-body` flag doesn't work the way you would think. Instead, it's used to inject your appendices. But, semantically, that's what it is for, almost. 

## The Trouble with Bibliographies

GMU requires appendices prior to the bibliography. That makes sense. The bibliography is a kind of appendix, one with bibliographic information. But, it's less important than substantive appendices. Unfortunately, pandoc `citeproc` appends the bibliography to the `$body$`. And -- although there are some workarounds -- they are all kludges here. 

I still have no good solution. The best recommendation right now is to build the `tex` file for the final copy, and move it yourself. That works for the overwhelming majority of the use case. 

Further references:

- *2012*: [Manipulating Bibliography/References List Location in Document](https://groups.google.com/forum/#!searchin/pandoc-discuss/location/pandoc-discuss/zza71I0zes4/KkYrkKMvGmIJ)
- *2013*: [references variable in templates](https://github.com/jgm/pandoc/issues/771)
- *2015*: [This Thread](Specifying location of bibliography in document)
- *2015*: [JSS template: Appendix not possible after references](https://github.com/rstudio/rticles/issues/29)
- *2015*: [Proposal: templating with headings // headings for table of contents / references / footnotes / etc](https://groups.google.com/forum/#!topic/pandoc-discuss/HxmpFK-Ydus)
- *2016*: [Allow bibliography to follow heading with id of "refs"](https://github.com/jgm/pandoc-citeproc/issues/210)


# Tips

## Live-preview on OSX

If you are on OSX, use skim instead of preview for watching changes to your PDF. Mavericks or something broke auto-reloading in preview. Skim works (with occasional crashes).
