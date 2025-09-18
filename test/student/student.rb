require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class StudentTests < Minitest::Test
  # ---- Part 1: warmup.rb ----
  def test_fib_edges_and_values
    assert_equal [], fib(0)
    assert_equal [0], fib(1)
    assert_equal [0,1], fib(2)
    assert_equal [0,1,1,2,3,5,8], fib(7)
  end

  def test_is_palindrome_various
    assert isPalindrome(7)
    refute isPalindrome(12)
    assert isPalindrome(1234321)
    refute isPalindrome(123421)
  end

  def test_nthmax_distinct_ranks
    arr = [5,4,4,1]
    assert_equal 5, nthmax(0, arr)
    assert_equal 4, nthmax(1, arr)
    assert_equal 1, nthmax(2, arr)
    assert_nil nthmax(3, arr)
  end

  def test_freq_basic
    assert_equal "",  freq("")
    assert_equal "a", freq("aaaaabbbcc")
    assert_equal "z", freq("zzzzzyyyyxxx")
  end

  def test_ziphash_good_and_bad_lengths
    assert_nil zipHash([1,2], [9])
    assert_equal({1=>10, 2=>20}, zipHash([1,2],[10,20]))
    assert_equal({"a"=>"x","b"=>"y"}, zipHash(%w[a b], %w[x y]))
  end

  def test_hash_to_array_preserves_order
    h = {}
    h[:x] = 1
    h["y"] = 2
    h[3] = "z"
    assert_equal [[:x,1], ["y",2], [3,"z"]], hashToArray(h)
  end

  # ---- Part 2: phonebook.rb ----
  def test_phonebook_add_rules
    pb = PhoneBook.new
    assert pb.add("Ann", "111-111-1111", true)
    refute pb.add("Ann", "222-222-2222", false), "Cannot add same person twice"
    refute pb.add("Bob", "999", true), "Reject wrong number format"
  end

  def test_phonebook_listed_number_only_once
    pb = PhoneBook.new
    assert pb.add("A", "200-000-0001", true)
    refute pb.add("B", "200-000-0001", true), "A number can be listed only once"
    assert pb.add("B", "200-000-0001", false), "…but can be reused as unlisted"
  end

  def test_phonebook_lookup_and_lookup_by_num
    pb = PhoneBook.new
    pb.add("Unlisted", "300-000-0001", false)
    pb.add("Listed",   "300-000-0002", true)
    assert_nil pb.lookup("Unlisted")
    assert_equal "300-000-0002", pb.lookup("Listed")
    assert_nil pb.lookupByNum("300-000-0001")
    assert_equal "Listed", pb.lookupByNum("300-000-0002")
  end

  def test_phonebook_names_by_ac_includes_unlisted
    pb = PhoneBook.new
    pb.add("J1", "400-111-1111", false)
    pb.add("J2", "400-222-2222", true)
    pb.add("K",  "401-333-3333", false)
    assert_equal ["J1","J2"].sort, pb.namesByAc("400").sort
    assert_equal ["K"], pb.namesByAc("401")
    assert_equal [], pb.namesByAc("999")
  end
end