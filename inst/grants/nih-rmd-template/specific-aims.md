---
output: 
   pdf_document: 
      template: template.tex
      keep_tex: true
      keep_md: true
      number_sections: true
      latex_engine: xelatex
      citation_package: natbib
geometry: margin=.5in
mainfont: Helvetica
fontsize: 11pt
linestretch: 0.9
indent: false
subparagraph: true
bibliography: references.bib
---

# SPECIFIC AIMS

## Background

### Trajectory of ADHD across development

ADHD typically presents early in life, most often diagnosed and treated between childhood and adolescence.
Less commonly, ADHD can insidiously emerge in adulthood in individuals with no history of inattention, hyperactivity, or impulsivity in childhood.
Notably, longitudinal data from the MTA ADHD Treatment Study suggests 90-95% of "adult-onset ADHD" is better accounted for by comorbid psychopathology, personality disorders, and/or substance use disorders *misdiagnosed* as ADHD.
The later-onset expression of ADHD thus appears to be a syndrome distinct from childhood-onset ADHD.

### Executive dysfunction in emerging adulthood

Interconnected networks of heteromodal association cortex orchestrating higher executive cognitive functions are still maturing during college.
It is therefore plausible generalized *executive dysfunction*, not undiagnosed ADHD per se, is underlying most clinical referrals for ADHD in college students.
We posit executive dysfunction is at the core of the real-world problems facing college students who self-refer for ADHD evaluation and treatment, which accentuates the comorbid difficulties these students face such as problematic drug and alcohol use, emotional dysregulation, and school failure.

### Limited diagnostic tools to assess ADHD and executive functioning in college students

Seeking evaluation and treatment for ADHD for the first time is now especially salient on *college campuses*, where the use/misuse of prescription stimulant medication as a cognitive-enhancing drug is rising faster than the actual incidence of the disorder.
The proliferation of college-onset ADHD, whether real or feigned, or early or late onset, signifies an increase in the demand to evaluate and treat ADHD across the lifespan.
However, clinicians do not have adequate, evidence-based psychodiagnostic tools available to evaluate ADHD/EF in this specific population that grows each year, nor do we have many objective assessment measures sensitive to *symptom validity* and *performance validity*.
Poor diagnostic tools lead to diagnostic errors, resulting in wasteful, inappropriate, or potentially even harmful treatment recommendations.
Without better research-derived clinical measures, we will continue to overdiagnose and treat students faking ADHD for secondary gain *and* underdiagnose students with unfeigned ADHD who need medical and/or academic interventions.

## Framework

Our long-term goal is to develop a targeted, performance-based executive functioning neuropsychological test battery for evaluating the varied expressions of ADHD and executive dysfunction in college students utilizing deep learning analytical methods.
The following research aims are proposed:

### Aim 1: Develop a model of executive dysfunction predictive of ADHD fit using deep learning.

The model will be psychometrically optimized and sensitive to developmental trajectories and feigning ADHD symptoms in college students.

### Aim 2: Assess the validity and generalizability of the ADHD classification model fit on independent datasets.

Importantly, to reduce the length of the final neuropsychological battery, poorly performing tests from Aim 1 will not be retained in Aim 2.

<!-- ## Methodology -->

*Sample* Study recruitment will focus on an intentionally heterogeneous cohort of 300 undergraduate and graduate students at USC with (a) documented histories of confirmed childhood or adolescent ADHD, (b) self-reported "adult-onset ADHD," or (c) no history or concern of ADHD to identify core neurocognitive signatures of childhood-onset versus adult-onset ADHD.

<!-- ### Executive Function Measures -->

*Executive Function Measures* We will utilize existing neuropsychological measures clinicians already use so that our resultant findings can be implemented into everyday clinical practice.
The training test battery will include performance-based, commonly used neuropsychological measures of executive functioning from the D-KEFS (sequencing, inhibition, switching), NAB Attention and Executive Functions Modules (attentional fluency, concept formation, cognitive efficiency, everyday attention, judgment), NIH EXAMINER (planning, cognitive control, fluency), WAIS-IV (processing speed, verbal working memory), and WMS-IV (visual working memory).
Intra-individual variability, group-level variability, group differences, and psychometric properties (validity, reliability, sensitivity, and specificity) will be estimated across core latent traits of executive functioning and systematically tested for their utility in predicting ADHD.
Poorly performing tests and/or cognitive factors will not be retained for final model validation and testing.

<!-- ### Malingering -->

*Malingering* The study will determine which executive function measures are optimally sensitive to feigning ADHD for secondary gain in college students.
To do so, each neuropsychological test will have a single-blinded randomized instruction provided to the student to either (A) give their best effort or (B) fake having ADHD for secondary gain (trained on how to do so).
Data will be split into three sets: training, validation, and test.
The aggregate training and validation datasets will allow us to make hard predictions for a new case of the form "Yes, this student is faking ADHD," or "No, this student is not faking ADHD." The test set allows us to quantify the uncertainty with which the prediction is made.

#### Impact

ADHD remains improperly diagnosed and treated in tens of thousands of promising college students.
The consequences of aberrant diagnosis and treatment of ADHD during this critical stage of young adult development can lead to functional impairments in school performance, educational attainment, career development, social-emotional development, and family and community life.
Thus, the need for evidence-based diagnostic tools specific to this rapidly growing clinical population is urgently stronger than ever.
