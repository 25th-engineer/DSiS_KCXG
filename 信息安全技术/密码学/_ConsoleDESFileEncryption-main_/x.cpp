int main()
{
	vector<uint64_t> block, processedBlocks;
	uint64_t klucz;
	string fileName, keyText;
	long size;
	char answer;
	bool encrypt = false;


	while (answer != 'a' && answer != 'b')
	{
		system("cls");
		cout << "Select operations:" << endl;
		cout << "a) Encryption" << endl;
		cout << "b) Decryption" << endl;
		cin >> answer;
	}

	if (answer == 'a')
		encrypt = true;

	cout << "Enter the file's name:" << endl;
	cin >> fileName;

	cout << "Loading..." << endl;
	block = loadBlocks(fileName, size);
	cout << "Loading complete." << endl;

	if (encrypt)
		addOtherBytes(block, size);

	cout << "Enter key:" << endl;
	cin >> keyText;
	klucz = breakdownByBlocks(keyText.c_str(), keyText.length() < 8 ? keyText.length() : 8)[0];

	cout << "Processing..." << endl;
	for (uint64_t blok : block)
	{
		uint64_t processedBlock = des(blok, klucz, encrypt);
		processedBlocks.insert(processedBlocks.begin(), processedBlock);
	}

	if (!encrypt)
		size = odczytajRozmiar(processedBlocks);
	else
		size = processedBlocks.size() * 8l;

	blockLog(processedBlocks, "result_" + fileName, size);
	cout << "Finished. The program will shutdown in 10 seconds." << endl;
	_sleep(1000 * 10);
	//system("pause");
return 0;
}