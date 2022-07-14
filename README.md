# Computer Systems Lab (“sys-lab”) -- WiSe 2022-23

## Course information

- This practical lab is organized by the [Chair of Decentralized Systems Engineering](https://dse.in.tum.de/) at TU Munich.
- Language: English
- Type: Practical course
- Module: IN2106 Master Practical Course
- SWS: 6
- ECTS Credits: 10
- Prerequisites: This lab course is only for masters. As such we don’t have any compulsory pre-requisites, but we prefer students to be proficient in the basic concepts of operating systems, distributed systems, systems programming (C/C++/Rust), or equivalent background.
- Preferred pre-requisite courses at TUM:
    -  IN0009 : Basic Principles: Operating Systems and System Software
    -  IN0010 : Introduction to Computer Networking and Distributed Systems
    -  IN2259: Distributed Systems
    -  Praktikum: Systems Programming in C++
    -  Strong programming and systems building skills are required.
- TUM Online: For registration you have to be identified in TUMonline as a student.
  -  Note: Compulsory enrollment after the first weeks of the matching outcome; students who fail to de-register in this period will be registered for the exam.
-  Recommended Reading: A list of open-source projects (with papers and source code) will be provided in the first meeting.

## Course overview

The computer systems lab is an advanced course where the students will work on an open-source project. The students will work on practical and state-of-the-art computer systems to evaluate them, dissect them, reveal their internals, and modify them to add new features. Overall, the course focuses on learning the art of building computer systems by deploying, analyzing, reproducing, and breaking practical computer systems! 

The term computer systems covers a broad range of topics, including distributed systems, systems for machine learning/AI, systems security, large-scale data analytics systems, storage systems, operating systems, file-systems, databases, multicore architectures, synchronization/concurrency primitives, parallel systems, compiler-assisted systems, dependability, reliability, cloud/edge computing, IoT systems, etc.  In short, we will focus on software systems that solve important practical problems. 

More specifically, the students will be given prominent open-source projects (research papers and associated open-source code) covering the aforementioned areas. The students (in a team of 4 students) accomplish the following primary tasks, with the mentorship of a researcher from our chair:

- **Stage 1:** Deployment and evaluation — Understand the system and associated open-source code. Analyze the source code of the system, deploy, and exercise it using real-life workloads.
- **Stage 2:** Build and contribution — Implementing additional feature(s) and demonstrating its effectiveness. The students are encouraged to contribute to the project by creating a pull request to get their feature(s) merged into the open-source project.
- **Stage 3:** Report and peer-review — Each team will submit a report (~4 pages) that covers their evaluation and contributions. Then each student, independently, will evaluate two reports from other teams.

There will be bonus points for students with accepted pull requests. Additionally, the top students will be nominated/encouraged to participate in the artifact evaluation committee for the major computer systems conferences: OSDI, SOSP, ASPLOS, EuroSys, etc.

In terms of organization, there will be three mandatory meetings:

- **Meeting #1: Kick-off:** Project selection and details on how to proceed.

- **Meeting #2: Deployment and evaluation:** Presentation on the project overview, deployment, and evaluation in addition to proposed additional feature(s).

- **Meeting #3: Contribution:** Final presentation and demo: Demo of the project with the additional feature(s) and the evaluation of their effectiveness.

- **Office hours:** Additionally, two office hours will be held during the first two stages. Each team will organize this with their mentor.


## Objectives
The goal is to gain a deep understanding of how modern computer systems, via open-source projects, are built and designed. More specifically, students will learn to:

- Concisely explain a complex computer system and the problem it solves.

- Empirically analyze, deploy, and evaluate a computer system.

- Extend existing systems with additional features that enhance the state of the art.

- Oral presentation and writing skills to concisely articulate the technical work.

## Teaching and Learning Methods
The students will work in a team of four, and each group will be assigned to a particular open-source computer system published in a recent top systems conference (SOSP, OSDI, EuroSys, ASPLOS, ATC, NSDI, …). The course will be split into four major components as follows. 

 -  a. **Phase I: Deployment and evaluation.** Students will be tasked, in groups of four, to select an open-source computer system published in a recent top systems conference (SOSP, OSDI, EuroSys, ASPLOS, ATC, NSDI, …). Students will have a couple of weeks to read the documentation, paper, and necessary related work, understand them. Students will then deploy the source code associated with that system. The goal will be to gain a deep experience with technologies used in state of the art systems and to acquire hands-on experience with evaluating complex computer systems.

- b. **Phase II: Contribution.** Students will then be tasked to implement an additional feature(s) that extends the existing system, either to mitigate some of its limitations or expand the use-case to other domains. The goal of this phase is to acquaint students with contributing to open-source projects and thus students are highly encouraged to perform a pull-request to get their contribution merged into the source code of the project.

- c. **Presentation** Oral presentations (15mins + 5 Q/A) will be held in front of the other students after each stage. The students will also give a demo of their systems in the final presentation. The audience will also be evaluated on their questions.

- d. **Report and peer-review.** Students will write a technical report (~4 pages) that covers the description of the project, the results of exercising the source code, and description and evaluation of the contributions of the team. Students will also evaluate each others’ reports (two reports in total). Each report will be assigned a number of anonymous reviewers that will evaluate the report and give advice to improve it. The quality of the reviews (argumentation, ways to improve the report, …) will be evaluated.

## Registration

- **Capacity:** We plan to have at most 24 places in the lab.
- **Deadline:** Two weeks after the matching period, we will formally enroll you for the course. If you want to drop out, you will need to inform us before the registration deadline.  

## Slack workspace

We will use Slack for all communication. Please enroll in our Slack workspace using your official TUM email address.

- **Slack workspace:** https://ls1-courses-tum.slack.com
- **Slack channel:** #ws-22-sys-lab

## Meeting place


We will be meeting three times (in-person, compulsory attendance):
  

- Kick-off meeting
- Phase #1 meeting
- Phase #2 meeting

In addition, four office hour meetings will be organized directly with the project mentor.

## Important resources

Please carefully go over the following resources to prepare for the seminar:

- [Overview](docs/sys-seminar-overview.pdf)
- [Paper reading](docs/paper-reading.pdf)
- [Presentation](docs/presentation.pdf)
- [Report](docs/report.pdf)
- [Participation](docs/participation.pdf)
- [Peer reviewing](docs/peer-review.pdf)
- [Grading](docs/grading.pdf)
- [System building](docs/system-building.pdf)

## Important dates

- **Preliminary meeting:** July 18th, 2022 10:30 AM

- **Kick-off meeting:** TBD

- **Research presentation (Day 1):** TBD

- **Research presentation (Day 2):** TBD

- **Report due (via HotCRP):** TBD

- **Peer-review due (via HotCRP):** TBD


## Tentative projects

- The exact list of projects will be released on Slack *in the first week*. Here are the potential projects:

  - FPGA OS
  - Nvidia SmartNIC
  - BPF for storage
  - Harvesting cloud storage
  - Container, ARM virtualization
  - IO stack for NVMe SSDs


## Report submission and peer-review portal

We will manage the submission and peer-reviewing of reports via HotCRP:

- [HotCRP portal](https://tum-dse-sys-lab21.hotcrp.com/) 


## Contact

For any further questions/comments, please contact the course organizer(s):

- [Dr. Koshiba](https://atsushikoshiba.github.io/)
- [Prof. Bhatotia](https://dse.in.tum.de/bhatotia/)

