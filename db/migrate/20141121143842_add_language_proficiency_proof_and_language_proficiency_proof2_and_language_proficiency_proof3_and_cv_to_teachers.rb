class AddLanguageProficiencyProofAndLanguageProficiencyProof2AndLanguageProficiencyProof3AndCvToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :language_proficiency_proof, :string
    add_column :teachers, :language_proficiency_proof2, :string
    add_column :teachers, :language_proficiency_proof3, :string
    add_column :teachers, :cv, :string
  end
end
