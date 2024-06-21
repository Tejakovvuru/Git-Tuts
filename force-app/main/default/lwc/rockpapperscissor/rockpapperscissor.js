import { LightningElement } from 'lwc';

const PAPER = 'Paper';
const ROCK = 'Rock';
const SCISSOR = 'Scissor';
const PLAYER_WIN = 'You win';
const COMPUTER_WIN = 'Computer wins';

export default class RockPaperScissor extends LightningElement {
    playerScore = 0;
    computerScore = 0;
    playerGuess;
    computerGuess;
    winner;
    gameOptions = [ROCK, PAPER, SCISSOR];

    handleClick(event) {
        this.playerGuess = event.target.name;
        this.generateComputerGuess();
        this.determineWinner();
    }

    generateComputerGuess() {
        const random = Math.floor(Math.random() * 3);
        console.log('the random number is ${random}');
        if(random === 0){
            this.computerGuess=ROCK;
        }else if(random === 1){
            this.computerGuess = PAPER;
        }else{
            this.computerGuess = SCISSOR
        }
    }

    determineWinner() {
        if (this.playerGuess === this.computerGuess) {
            this.winner = 'Draw';
        } else if (
            (this.playerGuess === ROCK && this.computerGuess === SCISSOR) ||
            (this.playerGuess === PAPER && this.computerGuess === ROCK) ||
            (this.playerGuess === SCISSOR && this.computerGuess === PAPER)
        ) {
            this.winner = PLAYER_WIN;
            this.playerScore++;
        } else{
            this.winner = COMPUTER_WIN;
            this.computerScore++;
        }
    }
}