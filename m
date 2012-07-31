Return-Path: <maniacbug@ymail.com>
Received: from nm38-vm0.bullet.mail.ne1.yahoo.com
	(nm38-vm0.bullet.mail.ne1.yahoo.com [98.138.229.144])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 082D5E002A8
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 20:16:48 -0700 (PDT)
Received: from [98.138.90.57] by nm38.bullet.mail.ne1.yahoo.com with NNFMP;
	31 Jul 2012 03:16:48 -0000
Received: from [98.138.89.195] by tm10.bullet.mail.ne1.yahoo.com with NNFMP;
	31 Jul 2012 03:16:48 -0000
Received: from [127.0.0.1] by omp1053.mail.ne1.yahoo.com with NNFMP;
	31 Jul 2012 03:16:48 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 494025.19518.bm@omp1053.mail.ne1.yahoo.com
Received: (qmail 88992 invoked by uid 60001); 31 Jul 2012 03:16:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024;
	t=1343704608; bh=TMB9jtOjMnpKjr/V+yvuXilhHoYD8G33IaeUZj+V6Y8=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=ujmX6T2qqq4kSyPevJNE7WMKaUCVXoy48/SckBwwwIy0uREhQiFBx6bCtk0E3ycjoOWFxJaqxtJagZX5JPLu7RD7pLcvNOVCDtynvD/Wu8lbD4IHTXOV2CfX2LBlAu9uCBMykuqYtVxMipNTS/tNUU7EwXG0uE7AABz1alk0CuI=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=ymail.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=iYOMuyo4GWC4a3fGTYXts4fW+AqUAS7M364+Sy7XRK1T326uVXaQ5m9u2VcDR9OFnKmyXXJClJvXjs+lJ8Aiv8PP4EWcyhLkymqq+I3ZY1DfVJ6lKU+A91Efww0YP3grqfcn65wfJY9IKuOR943mOhobsoTD+PXiOMOMsTub6yo=;
X-YMail-OSG: WlvJGS0VM1mJqJHNk1q312dHRTdoX41ZTNzrh3fWi14Tzxg
	wofI2Bm9fF6.Iisi3WlSobVYRMP7I30Kla09aWio1BmKWKa9mDRIgow8eNBT
	Lfl.HE4er61ylqBOnpFcnodKgPdGl13aDnjtJWCvJzjY3chHJ6bRghDIJUre
	QyE0J3NOmG3vca9MEx6GqWSuHrmd3MtxaAVEcIK5crxH3NhRiMg59WcN_lpF
	NfXFYX23yTnCBRXgVfL7NUXMTdaGDm.FuRFkFwFB0BVYAkiCNONejzXvA6Du
	vtbbbh90xyMEolYKRh.bt19w0tdsIQt.ujsToGMxCf7sdcaIqM_TnyPHK8ZL
	q9vYniPZhHIcHvfGjTmvLsVCF3aS0NmotJYj1VjbTDl7LCM.gDrz1_34kYE0
	xDpNdqRVI8IxN.yOSABgTDOhtvN8l2yy6B05ram6EUkAny7r.dwwYg8PJE0E
	SYRUvbP1MzdZI05USd91O3RxXdIwT
Received: from [50.135.220.100] by web121605.mail.ne1.yahoo.com via HTTP;
	Mon, 30 Jul 2012 20:16:48 PDT
X-Mailer: YahooMailWebService/0.8.120.356233
Message-ID: <1343704608.76381.YahooMailNeo@web121605.mail.ne1.yahoo.com>
Date: Mon, 30 Jul 2012 20:16:48 -0700 (PDT)
From: maniacbug <maniacbug@ymail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
MIME-Version: 1.0
Subject: MACHINE_KERNEL_PR ignored
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
X-List-Received-Date: Tue, 31 Jul 2012 03:16:49 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi.=A0 I am recompiling linux-omap4 per Denys' suggestion.=A0 I noticed tha=
t conf/machine/include/omap4.inc has MACHINE_KERNEL_PR =3D "r1" and linux-o=
map3_3.1.0.bb has MACHINE_KERNEL_PR_append =3D "a".=A0 Yet "bitbake linux-o=
map4" builds "linux-omap4-3.1.0-r0". Instead, I would have expected "linux-=
omap4-3.1.0-r1a".=0A=0A=0AAdding the usual PR =3D "rsomething", it now corr=
ectly builds "linux-omap4-3.1.0-rsomething".=0A=0Am.b=0A

