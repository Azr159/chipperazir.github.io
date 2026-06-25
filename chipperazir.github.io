<?php
/**
 * Implementasi Cipher Vigenere
 * Nama  : Moch Azir Fadila
 * NPM   : 525241016
 * Prodi : Informatika
 */

// ─────────────────────────────────────────────
// Cipher Vigenere – PHP
// Plaintext default: "Nama Saya Azir"
// Key: "AZIR"
// ─────────────────────────────────────────────

function vigenereEncrypt(string $plaintext, string $key): string {
    $key    = strtoupper($key);
    $result = '';
    $keyIdx = 0;
    $keyLen = strlen($key);

    for ($i = 0; $i < strlen($plaintext); $i++) {
        $char = $plaintext[$i];
        if (ctype_alpha($char)) {
            $shift = ord($key[$keyIdx % $keyLen]) - ord('A');
            if (ctype_upper($char)) {
                $result .= chr((ord($char) - ord('A') + $shift) % 26 + ord('A'));
            } else {
                $result .= chr((ord($char) - ord('a') + $shift) % 26 + ord('a'));
            }
            $keyIdx++;
        } else {
            $result .= $char; // karakter non-alfabet tetap sama
        }
    }
    return $result;
}

function vigenereDecrypt(string $ciphertext, string $key): string {
    $key    = strtoupper($key);
    $result = '';
    $keyIdx = 0;
    $keyLen = strlen($key);

    for ($i = 0; $i < strlen($ciphertext); $i++) {
        $char = $ciphertext[$i];
        if (ctype_alpha($char)) {
            $shift = ord($key[$keyIdx % $keyLen]) - ord('A');
            if (ctype_upper($char)) {
                $result .= chr((ord($char) - ord('A') - $shift + 26) % 26 + ord('A'));
            } else {
                $result .= chr((ord($char) - ord('a') - $shift + 26) % 26 + ord('a'));
            }
            $keyIdx++;
        } else {
            $result .= $char;
        }
    }
    return $result;
}

// ── Main ──────────────────────────────────────
$plaintext  = "Nama Saya Azir";
$key        = "AZIR";

$ciphertext = vigenereEncrypt($plaintext, $key);
$decrypted  = vigenereDecrypt($ciphertext, $key);

echo str_repeat("=", 40) . "\n";
echo "  Vigenere Cipher - PHP\n";
echo "  Moch Azir Fadila | 525241016\n";
echo str_repeat("=", 40) . "\n";
echo "Plaintext  : $plaintext\n";
echo "Key        : $key\n";
echo "Ciphertext : $ciphertext\n";
echo "Decrypted  : $decrypted\n";
echo str_repeat("=", 40) . "\n";
