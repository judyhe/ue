class CreateStudentTerms < ActiveRecord::Migration
  def self.up
    create_table :payer_types do |t|
      t.string :name, :null => false
    end
    
    create_table :student_term_payments do |t|
      t.integer :student_term_id, :null => false
      t.decimal :amount, :precision => 10, :scale => 2
      t.integer :payer_type_id, :null => false
      t.string :payer_type_other
      t.references :payer, :polymorphic => true
      t.timestamps
    end
    
    add_index :student_term_payments, :student_term_id
    add_index :student_term_payments, [:payer_id, :payer_type]
    add_index :student_term_payments, :payer_type_id
    
    create_table :student_terms do |t|
      t.integer :student_id, :null => false
      t.integer :term_id, :null => false
      t.datetime :application_date
      t.decimal :cost, :precision => 10, :scale => 2
      t.integer :school_id
      t.integer :grade_id
      t.decimal :income, :decimal, :precision => 8, :scale => 2
      t.integer :not_placed_reason_id
      t.string :not_placed_other
      t.boolean :completed, :default => false
      t.boolean :student_eval, :default => false
      t.boolean :program_eval, :default => false
      t.boolean :parent_eval, :default => false
      t.boolean :teacher_eval, :default => false 
      
      t.timestamps
    end
    
    add_index :student_terms, :student_id
    add_index :student_terms, :term_id
    add_index :student_terms, :school_id
    add_index :student_terms, :grade_id
    add_index :student_terms, :not_placed_reason_id
        
    create_table :student_term_not_placed_reasons do |t|
      t.string :reason, :null => false
    end
    
    create_table :activities_student_terms, :id => false do |t|
      t.integer :activity_id, :null => false
      t.integer :student_term_id, :null => false
    end
    
    add_index :activities_student_terms, :activity_id
    add_index :activities_student_terms, :student_term_id
  end

  def self.down
    drop_table :payer_types
    drop_table :student_term_payments
    drop_table :student_terms
    drop_table :student_term_not_placed_reasons
    drop_table :activities_student_terms
  end
end
