## Data
Keep your data (e.g. from evaluations here)


* If you involved human subjects in any form, you will require ethical permission.
    * Keep records of all items related to ethics in `data/ethics`. There are templates for scripts, guidance provided.
    * **You must have scanned PDFs of signed checklists in this folder**, or PDFs of ethics confirmations from other sources
    * Ensure you remain GDPR compliant. In general:
        * Never collect personally identifiable information if at all possible. 
        * Pseudonymise identifiers for subjects. 
        * Use coarse demographic values unless you need specific information (for example, if you need age ranges, collect ranges, not specific ages)
        * Ensure you have explicit consent for the storage and use of data from human subjects
        * DO NOT STORE PERSONALLY IDENTIFIABLE INFORMATION ON REMOTE SERVERS (no Dropbox, Github, etc.)

* Keep a written description of the data, what is contained, and how it was captured in `data/readme.md`
* Record all raw data as an immutable store. **Never modify captured data.** 
    * Keep this under `data/raw`
    * This could be logs, questionnaire responses, computation results

* Write scripts to produced processed data from these (e.g. tidy dataframes, excel sheets, csv files, HDF5 files, sqlite databases)
* Write scripts that process these into results, visualisations, tables that you include in your project.
* If you use Jupyter/RStudio notebooks, place these in `data/notebooks` and name them carefully (not "Untitled1", "Untitled2").

* You may need to remove the `data/` folder from version control if the data size is too large or you are bound by confidentiality.
* If you do so **make sure you have good backups**


## Data Collected
* Data was collected via google form surveys
* Before completing any surveys, participants were asked to fill out consent forms for the to surveys they would participate in (General Attribute Survey, and one of the AB Test group surveys)
* The General Attribute Knowledge survey contained information based on what students know already about graduate attributes and how much experience they have with these attributes and reflecting on them
* The survey followed a format of Yes/No questions, but after every question there was the oppurtunity for participants to give any written feedback on the question and allowed for more input from the participants
* The AB Surveys involved participants being randomly assigned to group A or B
* The first group was the experimental group - they were given CBT style questions, aimed at encouraging more reflection from participants
* The second group was the control group - they were given job interview style question, these styless of questions are intended to provoke some reflection from people during job interviews but do not provide any structure for this to aid participants
* From these Google Forms - an excel spreadsheet CSV file was created which contained the answers to the surveys
* This excel spreadsheet does not contain any names of participants and is anonymous 
* None of the answers were modified from the original answers within the Google Forms
