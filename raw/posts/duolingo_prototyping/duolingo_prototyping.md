
# Lo-fi Prototype and Analysis

## Prototype Links

[Figma](https://www.figma.com/proto/z3bBkXsbt0P6hncqawHWCK/hw2?node-id=72%3A46&scaling=scale-down)

[Diagram and overview of features](./raw/posts/duolingo_lofi_analysis/diagram.pdf)

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
