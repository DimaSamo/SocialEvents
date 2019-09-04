class User{
    constructor (id, first_name, last_name, bio, email){
        this.id = id
        this.first_name = first_name
        this.last_name = last_name
        this.bio = bio
        this.email = email
    }

    full_name(){
        return `${this.first_name} ${this.last_name}`
    }
}