Return-Path: <maniacbug@ymail.com>
Received: from nm3.bullet.mail.ne1.yahoo.com (nm3.bullet.mail.ne1.yahoo.com
	[98.138.90.66])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 9EC49E00283
	for <meta-ti@yoctoproject.org>; Tue, 24 Jul 2012 20:36:55 -0700 (PDT)
Received: from [98.138.90.51] by nm3.bullet.mail.ne1.yahoo.com with NNFMP;
	25 Jul 2012 03:36:55 -0000
Received: from [98.138.226.165] by tm4.bullet.mail.ne1.yahoo.com with NNFMP;
	25 Jul 2012 03:36:55 -0000
Received: from [127.0.0.1] by omp1066.mail.ne1.yahoo.com with NNFMP;
	25 Jul 2012 03:36:55 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 22838.72344.bm@omp1066.mail.ne1.yahoo.com
Received: (qmail 33740 invoked by uid 60001); 25 Jul 2012 03:36:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024;
	t=1343187414; bh=rK88gU1sGV+BsXtu81mWmvsKXHkesQIdjt3OxOfWFfE=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=jAf9kM7hEz4taNSMmZvA/Jb0XXDenrbjr0Si+ZxbCiRZIn25lF1+AYvOzCnfs9HpRyDf/Tmh60Avt7Iyh+zXqfxFf7y8yR6F1r40WnwRo/37FTCYL3DOwVWt8chCsj0PTG3TfHkia5UGVAXxxKuQyoYtT8VHZ7BrOP54Dy+84/U=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=ymail.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=v1i4RyWc8qGvAqfa67O5rWvTNKsxadw3URr6zpc+Ip98q8MtaD3woelL4VsKuiMJNvlMATbEsq35WH1LDnPMRgxXEyV8TZbFXaymfYoIrA3eItVb1szAevoBOJ108iR4IdJBxxz5wd292xg7opWkXKDk//MLqrh3fR57Ptd/ZcY=;
X-YMail-OSG: AWKnIcQVM1nnUG4hfYgrLa90kdJON01hwccG85kk7Gl719A
	TByHdP0sFhOpwtDJNTfz.uyt7ODf9t5bPMOMElVAZdWzfi84BAIzQ9Gfljkc
	zdLpoFGF6HGJ5qAI5Ww2oCqEBlJ6XlYuuQw1KMSUD6o5W3nGO8mMYdyL2xhS
	RinHi46Ptds9A9oqVhloSofSD7Etd2xrF1k6bM5Mse2o0o2k1hDYj_K.uIjZ
	UG2U5wgkhbXwpY430SJEqO7xD1WDHZzgp0ohQxX79sfF7V1UDHPutOqfAQ.p
	BIb8LT9uXo9xa5_qbB53qnfqRSj2dkai9r3Noi6D9ADx9g2fA4Dm5PR0cTa3
	X8_dYp8G2aDez6ibb0de47xFt6oZ3q8gEzBMjisXOkKBwkvn3KUM9pw1VXwC
	mPr1l7ZqRPkFDw7uJrlvFUt1NBNefQA--
Received: from [50.135.220.100] by web121605.mail.ne1.yahoo.com via HTTP;
	Tue, 24 Jul 2012 20:36:54 PDT
X-Mailer: YahooMailWebService/0.8.120.356233
Message-ID: <1343187414.7556.YahooMailNeo@web121605.mail.ne1.yahoo.com>
Date: Tue, 24 Jul 2012 20:36:54 -0700 (PDT)
From: maniacbug <maniacbug@ymail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
MIME-Version: 1.0
Subject: omapfbplay depends on libav
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: maniacbug <maniacbug@ymail.com>
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 03:36:55 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

But where does one find a recipe for libav?=A0 I've looked=A0 in Angstom an=
d Yocto, but cannot seem to find it.=0A=0AWhile I'm at it...=A0 I'm looking=
 for a way to play mpeg4 or h.264 from the command line.=A0 omapfbplay seem=
s like the best choice.=A0 Does anyone have another recommendation?=0A=0ATh=
anks,=0A=0Am.b=0A

