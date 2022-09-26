#### Contents

1. [Design Problem Analysis](./compiled/posts/duolingo_prototyping/index.html#design-problem-analysis)
2. [Lo-fi Prototype and Evaluation](./compiled/posts/duolingo_prototyping/index.html#lo-fi-prototype-and-evaluation)
3. [Hi-fi Prototype](./compiled/posts/duolingo_prototyping/index.html#hi-fi-prototype)
4. [Hi-fi Prototype Evaluation](./compiled/posts/duolingo_prototyping/index.html#hi-fi-prototype-evaluation)

---

# Design Problem Analysis

## Problem Overview

Duolingo continues to accrue users through memetic marketing and the widespread promise of a flexible and approachable introduction to learning a foreign language.

This promise is largely fulfilled through Duolingo's rapid flashcard-like instruction that introduces users to new concepts quickly (by way of an efficient interface and recognition tests) and drills them on previously acquired skills in order to reinforce mastery.

![Two examples of recognition-oriented teaching in Duolingo](./raw/posts/duolingo_prototyping/recognition.png)

More difficult lessons introduce recall-based systems where users are ask to construct translations from memory (when keyboarding is supported) or from a word bank (when viewport size disallows keyboard use) that converts the testing paradigm to modified recognition.

![A desktop example of recall-oriented teaching in Duolingo. The "make easier" button converts the keyboard to the word bank shown on the right side of the previous image.](./raw/posts/duolingo_prototyping/recall.png)

While both of these methods of teaching, as well as a new conversational interface that allows for speaking practice, serve the acquisition of new languages for speaking purposes with their audio-text pairings, persistent friction can occur among those who wish to learn a language with a writing system far different from their own or solely within a writing context.

### Transferability of Skills Across Writing Systems

While Duolingo does formally introduce and explain changes in speaking paradigms (such as tone) across languages, no attention is deliberately called to the features or elements that define the written form of each language. Restricting the capability of personally constructing new symbols within lessons disallows storage of the defining features of written language, which powers all Duolingo lessons. This shortcoming is particularly relevant in learning Chinese (or other logographic languages), a language which constructs words from radicals that carry indications of both meaning and pronunciation.

![A beginner Korean lesson that asks the user to rotely memorize novel symbols (interacting with a tile produces the sound associated with the symbol).](./raw/posts/duolingo_prototyping/korean.png)

Such a shortcoming causes increased difficulty in the early stages of learning (as trial and error must be exercised often) and may lead to a false conception of a language's structure (which can inhibit acceleration of the learning process), especially among users that occupy one or more of the following categories:

1. Native speakers of a language with an alphabetic structure attempting to learn a logographic or syllabic language or any language with symbols that do not match or resemble the symbols of their native language.
2. Native speakers of a logographic or syllabic language attempting to learn a language with an alphabetic structure or an alphabetic structure that differs from what is familiar.
3. Users with a reduced speaking capacity (i.e. deaf users) that wish to learn a language in its written context.

Implementing early writing practice through a sketching interface, supporting keyboard use (especially keyboards that allow handwriting) for all existing recall-oriented learning, and tutoring users on how to activate foreign language keyboards would help offset the difficulties experienced by the above subset of users, improving the quality and strength of their learning.

## Stakeholders

Beyond the benefiting subset of Duolingo users described above, the concerns of other stakeholders must be considered in order to ensure a smooth adoption of new, course-changing features.

### Current and New Users

Duolingo already has a relatively large body of users that use the service on a daily basis. Existing users continue to use the service because of the quick, game-like way they can study new features and words in a language while gradually improving their overall understanding. New writing lessons must offer the same level of engagement and reward as existing lessons such that users do not become frustrated with changes to what is familiar.

New users, specifically those who have made little progress within a given Duolingo course, but including those that might be attracted solely because of new writing features, must be accomodated, in conjunction with existing users, in order to make writing lessons intuitive and engaging. Maintaining this level of engagement will require asking for feedback on new features and usability tests that evaluate the quality of the experience of using a new writing feature.

### Advertisers

Because Duolingo is free, advertising plays a large part in producing funding for the application. Advertisers currently partnered with Duolingo and advertisers considering partnership understand that the application's demographic encompasses a large range of ages, decreasing the pool of viable advertisements to those appropriate for children. Because the main goal of advertisers is to increase user exposure to their ads, they should understand that support for writing-oriented learning would add more lessons to the system (and potentially more users), effectively increasing exposure to ads (as each lesson ends with an ad when the user has not paid for a premium account).

### Developers

Duolingo's development team has made a concerted effort to make their lesson systems and interfaces scalable across languages. The introduction of the writing technologies to be described in the prototyping section will be scalable across languages, allowing for easy integration with the current method of organizing lessons. Developers may be concerned with solving new backend problems that potentially involve machine learning methods irrelevant to the current Duolingo system, however, integration of these systems (such as a computer vision system for recognizing written characters) should progress smoothly as libraries for handwriting analysis already exist, any other new system features will simply be extensions or modifications to existing features. In conjunction with implementing these libraries, a simple sketching backend that responds to user mouse or finger dragging gestures is feasible and could be developed rapidly and improved upon through usability tests.

Developers will need to include, in addition to new machine learning technology, a system or "mode" that allows blind users to continue to use the system with a screen reader and vocal dictation as handwriting may present difficulty. This may involve exclusion of handwriting lessons altogether or replacing these sections with keyboarding, a task which is equally as scalable as integrating writing lessons into the current structure as writing-oriented lessons could be toggled or skippable (as existing vocal tests are skippable).

### Scientists

Duolingo has several learning scientists within the company responsible for optimizing learning for specific languages. Introducing writing instruction (specifically in the beginning stages of learning) may require altering early lessons to contain tracing and writing practice that occur one after another and future lessons to contain writing oriented practice, unless a deliberate switch is made from handwriting to keyboarding during a transitional period. This switch would also require effort from developers who would have to ensure that users have access to or are aware of their device's foreign language keyboards through a "tooltip" system.

## Prototyping

### Role of Prototyping

Essential to the integration of writing practice into Duolingo will be the construction of prototypes that fulfill the learning requirements for a handwriting lesson while also following the standards set by Duolingo. As prototype versions are iterated upon, extraneous and missing features will be removed or added, respectively, in response to usability testing and investigation of Duolingo's design guidelines. Ultimately, this iteration process will reveal how or when writing lessons will be placed among existing lessons and how this process can be optimized for use as efficient as each of Duolingo's current lesson types.

### Tracing New Symbols

Crucial prototypes for both the mobile and desktop versions of Duolingo (or tablet version, as it achieves the same viewport requirement as the desktop version) will be an interface for tracing over new alphabetic characters, syllabic characters, logographic components, and complete logographs with demonstration animations for symbols with a particular stroke order. Such an interface will be particularly useful in the early stages of learning any new language as symbol shape will be unfamiliar.

### Freehanding New Symbols

Beyond a tracing interface, a freehand sketching interface will be required to test both the recall of characters and proper handwritten construction. This interface will operate similarly in its appearance and interaction to the tracing interface with the exclusion of a silhouette of the character or symbol to be learned. Freehand sketching will also need to immediately follow tracing (or be present in the same lesson) in order to solidify construction of new characters. An interactive element within the freehand interface that allows users to receive a hint or bring up the entire silhouette of a character will also be necessary for effective learning and maintaining user interest.

### Changes to Lesson Progression

Overarching lesson structure will also need adjusted and re-prototyped (though no major changes to interface design are necessary) in order to teach logographic components as if they were words (see the first and third images above as the Korean section of Duolingo nearly achieves this) with the intent to integrate these components into the teaching of entire logographs.

### Universal Keyboard Support

Prototypes for mobile phone teaching interfaces that utilize the word bank should integrate interactive components that allow users to switch to keyboarding their responses, as both the desktop and tablet versions of Duolingo offer this capability.

Lastly, "tooltips" that introduce and explain to the user how to use their device's foreign language keyboards must be prototyped in order to ensure that an attempt is made at encouraging recall-oriented, composition practice.

---

# Lo-fi Prototype and Evaluation

## Prototype Links

[Figma](https://www.figma.com/proto/z3bBkXsbt0P6hncqawHWCK/hw2?node-id=72%3A46&scaling=scale-down)

[Diagram and overview of features](./raw/posts/duolingo_prototyping/diagram.pdf)

### Participants and Materials

Three users assisted in testing the Figma prototype found at the link above.  This prototype was displayed on a 2-in-1 laptop folded to act like a touch screen tablet.  In testing the prototype, users also made use of a third party app called [Epic Pen](https://epic-pen.com/) in order to mark up the surface of the tablet when necessary; this method was chosen because no prototype-integrated sketching interfaces could be found.

### Procedure

Prior to testing, users were introduced to Epic Pen and instructed on how to make marks, switch back to their cursor, and clear the screen (which was to be done after each task).  Once they had been briefed on how to use this tool, each of the users individually (and while thinking aloud) completed a suite of tasks within the prototype with practitioner-initiated pauses between each task to explain what was to be attempted or accomplished.  Regardless of their performance on certain tasks, users were shown screens that demonstrated what it would look like if they incorrect and what it would look like if they were correct.  Users were also encouraged to deviate from the task at hand and interact with elements other than the central element(s).

The tasks were as follows and each required no prior knowledge of the foreign languages used as examples. Explanations follow each element in the list.

1. Tracing logographs
	- Users were instructed to trace the word in the center and move on when they had finished.
2. Tracing alphabetic characters
	- Users were instructed to trace over each letter in an example word and move on after they had finished each letter.
3. Freehanding logographs
	- Users were instructed to use hints whenever possible, an action which would reveal more of the tested logograph's strokes.  Once hints had been used up, subjects were asked to complete the logograph as best as they could and move on.
4. Freehanding alphabetic characters
	- Users were instructed again to use hints whenever possible and complete each letter in the example word, moving on when finished.
5. Logographic component recall
	- Users were instructed to use trial and error to find the correct logographic component.
6. Matching logographic components with their respective characters
	- Users were instructed to again use trial and error to find the pairs, this time with the preliminary information that characters had pronunciations beneath them and components (radicals) did not (as not to hinder their progress because of a lack of knowledge about the language being tested).

### Results and Discussion

Though all three participants were capable of completing each of the tasks, procedure and materials could have been optimized to prevent many of the major hindrances encountered during each test.  Each participant ran into difficulty adjusting to the fact that they had to perform their own upkeep of the screen marking tool, a process which should be handled by the prototype itself, not a third-party application.

The screen mark-up tool served as a source of frustration for one user, who expressed that "switching back and forth [was] annoying" and confusion for the two others: one who thought the prototype (which has no real backend) was not responding correctly to their writing (when being shown the incorrect and correct screens) and one who found it hard to see the next parts of their task through all of the marks from the previous one as they had not yet cleared their screen.	

Aside from issues with third-party applications, buttons that indicated users were correct performed well and were understood, but buttons that indicated they were incorrect caused pausing (even when told they would appear), likely because some subjects had actually performed well on the task, but were still shown an "incorrect" screen.  Other transitional instances that indicated they were correct or incorrect, such as color shifts in the elements in the logographic component section, also performed well, though two users discovered a bug where text disappeared from tiles in the recall exercise.  Every user paused when the elements in the matching section faded out (indicating they were correct), though this may have been caused by the delay attached to the transition.

Elements at the top of the screen: the progress bar and the undo, activate sound, and exit buttons were left untouched, likely due to one or more of the following reasons:

1. Their color differed from all other elements
2. Users had no use for them (for example, the undo button was unlikely to undo what they had written with Epic Pen)
3. Figma gave no graphical cues to click on them when they clicked on other inactive parts of the screen

The progression of testing in both alphabetic character sections appeared discontinuous to all users, as only the first two letters were tested and controls were not consistent across tracing and freehanding (one required the user to click "check" and the other required them to click the completed letter).  These issues served to confuse users as not enough time was given to adjust to the format of correct letters appearing on the line above the writing tile and the format of hints revealing strokes within the letter being tested.  One user, after using the "hint" button, which they had been instructed to use, paused, unaware that anything had happened to the writing tile at all, a difficulty compounded by the fact that submitting answers differed across the tracing and freehanding sections.  All users were also not completely aware they had finished the alphabetic character sections until they began receiving instructions for the next section.  All three paused at this point, expressing confusion that they had managed to finish the task.

### Future Directions

Due to the array of issues discovered in both the testing procedure and the software, future iterations of the prototype should implement or make use of an integrated sketching interface that does not require the user to switch between marking up the screen, clicking, and clearing previous marks.  Testing the correctness of responses in future prototypes should be done through a networked program where the practitioner can mark user responses as correct or incorrect during testing (due to a lack of handwriting analysis tools) and show  proper feedback, contributing to measureable learning and efficiency of use among users and between the tracing and freehanding sections.

Freehanding and tracing exercises for alphabetic characters should include all letters in the word being tested as not to disrupt user flow. A change of this type could contribute greatly to user success in building a conceptual model of the software's mechanics and learning what the software aims to teach.

Though they performed better than the tracing and freehanding interfaces, both logographic component practice areas could also be improved upon.  Once the discovered visual bugs are corrected, more deliberate or telegraphed feedback when users are successful in learning the material should be implemented.

Because each of the discussed changes relate to user success and the potential of the software to offer legitimate methods for foreign language learning, implementing sound (in the same way Duolingo already does: by playing the pronunciation of a clicked-on word) in order to form connections between words, their sounds, their appearances, and the schema for writing them could be valuable.

With each iteration of this project, I hope the problem scope of digital language learning begins to take a more coherent shape, illuminating issues that hinder its progress, while pushing it toward states where these hindrances are lifted.

---

# Hi-fi Prototype

[Github Repository](https://github.com/mceld/duolingo-hifi)

Following the instructions in the `README` of the above Github repository will allow you to run the hi-fi version of this project on your computer. Running the prototype requires `node`, `npm`, and a service (like `gulp` for example) with the ability to compile and serve a CoffeeScript file to localhost.

The contents of the Github repository, once downloaded and set up, use the `1` and `0` keys (not numpad) to switch between "correct" and "incorrect, and the `2` key to cycle through letters in both Russian exercises. This feature allows a usability tester to act as the backend, switching or precipitating particular states in the software when the user responds to the application's prompts.

---

# Hi-fi Prototype Evaluation

### Overview

The same three users that assisted in testing the lo-fi iteration of this system assisted in testing the hi-fi iteration. The prototype was displayed on the same touchscreen laptop, but at a desk, rather than in tablet mode. Testing used the same third-party, screen-marking application [(Epic Pen)](https://epic-pen.com/) from before, but users were not required to switch between marking and clicking, these actions were performed by the practitioner via hotkeys on a keyboard wired into the laptop and placed away from the user testing area (users were only required to tap the screen once to ensure the prototype's window was in focus after finishing a screen-marking task). Testing covered all features (i.e. navigation, typographical arrangement, interaction, and potential for learning) of the prototype. Potential backend features that might drive the recognition and assessment of user-generated writing were not implemented or tested.

### Procedure and Participant Tasks

Tasks were structured similarly to the tasks used during lo-fi testing, though they differed greatly in their phenomenology because of the changes made to the Epic Pen protocol; natural interaction with the application was far easier to achieve given hotkey control of Epic Pen and practitioner mistakes rarely caused trouble and sufficiently simulated backend features.

Below is a list of the tasks performed (in order of testing), each prompted by typographical and interactive elements within the interface (not by verbal direction). Pertinent information regarding the language being tested was given by the practitioner prior to testing in order to support user interaction.

1. Logograph tracing
	- Users were instructed to trace a word on a central tile.
2. Tracing alphabetic characters
	- Users were instructed to trace a word given to them on a line, changing of the interface via hotkeys simulated writing interaction on the central tile and revealed to them that letters were registered one at a time.
3. Logograph freehanding
	- Users were instructed to write the same word they had traced during the first logograph exercise (revealed by the fact that the definition was the same). One hint could be used to reveal half of the logograph's strokes.
4. Freehanding alphabetic characters
	- Users were instructed to write the word that appeared in the alphabetic tracing exercise (revealed by the fact that each had the same definition). One hint could be used to show the word on the line above the central tile.
5. Logographic compoenent recognition
	- Users exercised trial and error in order to find which logographic compoenent matched the proposed definition (answer feedback was automated and required no use of hotkeys)
6. Matching logographic components with their respective characters
	- Users again exercised trial and error to find matches between logographic components and their characters, Users were told before this task that tiles with characters contained letters, whereas components did not. Answer feedback was also automated in this task.

### Results

Though it was a major concern during lo-fi testing, Epic Pen did not heavily impede on testing the prototype during this iteration; features and design choices beyond those of Epic Pen were framed in their natural contexts and allowed users to reveal issues with the software being evaluated. Whether overcoming this difficulty was solely a result of hotkey use or user expertise in the testing paradigm (as the same participants were used in lo-fi testing) is unknown, though both likely contributed.

While all participants were able to eventually realize that words were shared among the writing and tracing sections, testing languages intermittently (logographs interrupting alphabetic exercises) contributed to initial confusion as to what each user should write on the central tile. Suspending or failing to include information (such as the language they are learning or what the word sounds like, as one user simply wrote the listed pronunciation during the logograhic writing task) detracted from the potential for the system to provide a reasonable or achievable challenge; the language's necessary features or fundamentals were presented in a disjointed way.

Though this structural issue contributed to user confusion, the feedback they received when they were incorrect was highly informative and clear, allowing each user to then produce what the system expected on their next trial. Learning that there were no consequences to getting something wrong (that is, the exercise would start over), one user indicated that they would simply draw a picture of a sun and move on to see the answer.

Incorrectness appeared to be telegraphed by the graphical elements much better than correctness, as one user did not realize they had gotten the answer correct; the green logograph in the central tile was obfuscated by writing, and the "correct panel" and "you are correct" text that appeared near the central button was not obvious (in its motion or presentation) or did not contrast heavily enough with the central button.

Writing and tracing in both alphabetic tasks were more natural than logographic tasks (likely due to user familiarity) and users understood the "one letter at a time" paradigm, though more feedback could have been given in the freehanding sections as to what letter is currently being accepted as input. Despite the inclusion of a hint button in both freehanding exercises, it was seldom used (though one user attempted to use it more than once in a single exercise out of frustration that he could not remeber the "word from before"). Whether this lack of usage was a consequence of the hint button's visual properties or the attitudes of users was not clear during the test, though additional hints could be added to future versions, conveying that they are not a "last resort", but a simple hint to propel their learning.

Apart from the writing tasks, both the recognition and matching tasks performed very well and supported natural user interaction through their comprehensive interactability and automated answer checking. Trial and error was effectively used by each user to successfully complete each of the tasks, though changes could have been made to the opacity of correct matches, as it seemed to be a pain point for one user, prompting their interaction with an already matched tile.

Two users, following both of these last tasks, even reported that they had learned something from the recognition exercise, and could use this knowledge to help them in the matching exercise. One user also reported that a logographic component "was a part of the word from before" indicating that they now understood the concept of components and logographs just by using the software. This was very exciting and could be used to determine the temporal ordering of these lessons in order to properly support application of user knowledge.

### Discussion and Future Directions

As indicated by the **Results** section above, minor visual changes should first be made to the prototype in order to correct the pain points surrounding the hint button and "correct" feedback. More than one hint (through multiple buttons, or a meter) should be provided on each recall/freehanding task and should convey to the users that these hints are specific to this task and will not penalize them. Apart from these visual changes, sound and equivalent informational pop-ups that provide the user context on what is being tested should be included in future iterations, reflecting the structure of analogous elements modeled in the lo-fi prototype and in current Duolingo software.

The greatest finding from this usability test was certainly the issues that arose from temporal placement of exercises and the mixing of language domains. Future iterations should separate tasks according to language, a methodology already present within Duolingo. Additionally, because of how easy they seemed to accomplish, logographic component recognition and matching should be placed before logograph tracing and writing as they provide foundational information relevant to constructing logographs. Each logograph should also be given a hint as to the logograph's meaning or pronunciation in its radical form such that users can acquire knowledge and base their interactions on something other than trial and error.
