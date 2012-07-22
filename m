Return-Path: <maniacbug@ymail.com>
Received: from nm14-vm1.bullet.mail.ne1.yahoo.com
	(nm14-vm1.bullet.mail.ne1.yahoo.com [98.138.91.38])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D2EE6E00342
	for <meta-ti@yoctoproject.org>; Sun, 22 Jul 2012 13:15:24 -0700 (PDT)
Received: from [98.138.90.49] by nm14.bullet.mail.ne1.yahoo.com with NNFMP;
	22 Jul 2012 20:15:24 -0000
Received: from [98.138.89.192] by tm2.bullet.mail.ne1.yahoo.com with NNFMP;
	22 Jul 2012 20:15:24 -0000
Received: from [127.0.0.1] by omp1050.mail.ne1.yahoo.com with NNFMP;
	22 Jul 2012 20:15:24 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 280575.857.bm@omp1050.mail.ne1.yahoo.com
Received: (qmail 97928 invoked by uid 60001); 22 Jul 2012 20:15:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024;
	t=1342988124; bh=N46h4NDR1PxKDTuLMtnGR2Aj2hAtmjyiqzNTDzk4xbI=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Saz82r7wa++TiyGLQhqTnFyZYYogQcIS19rV2/RwuOJmhIYi3lolmnu8nYSqWMAKSzsXOeEoRUmq9jJ0wPas86bVttyhqmJLQRpnZXloetmoU3gU7jM+QiZTs0XxE4vrH7XB1fdivxcakyz+anAj78FQJ7TrIB0A1lSYu5eNs1o=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=ymail.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=3iC5NavMWJpSIY5yin9Qv2b3CzAYpU9QydEtBR1Csu0VDyti+m+dvNvOwnsz4ywgF7jSjkQUYwsNgcAgRuGz+IXf4CJLYzmG/54xjtO9drcZ67apYOOry9E4LWLcqeJXLWKTiY9c2dW9tPDOfJc/1t57wZoCXC+KXECU5bbBJJc=;
X-YMail-OSG: 2stblTgVM1lMCPB.1c13d2waP8B0wLbRRgj0P4rIwfKJiPm
	vqtKgQ9Owr3TmeElxt.NkupJcD3oijQQmF5vTyKb7YZHZ3La.yK32GiFBLEP
	JwRXXXZ_l0VPuLF_DlqC5X9Mx29eVfs0V.N8WDcHaY5yZDTokYtTX.4yImTx
	EfZgGFvOYvVI7b3qImLqs11X8GqTb8SIqHpP1z7fbQpcNK7SD8DYEuxRvgPC
	qKjMMZfLQyA609wl1XzpeXZhcXCXrhNXNp4pnjYJ8va8y5T06F1oYtLWWwBI
	oXjHuWhQhRNyy55FEPeEpaBc80HmirmX72zEv5b5DtbRi3.I4OD31WvDA7Zt
	wiDUuAWLkJC4lYp2TFg_BZIomCj5QPxy0APkpTjBqIFPvdzsQObGMyRVluxd
	LYztu.zcGtPVl7D4-
Received: from [50.135.220.100] by web121603.mail.ne1.yahoo.com via HTTP;
	Sun, 22 Jul 2012 13:15:24 PDT
X-Mailer: YahooMailWebService/0.8.120.356233
Message-ID: <1342988124.95264.YahooMailNeo@web121603.mail.ne1.yahoo.com>
Date: Sun, 22 Jul 2012 13:15:24 -0700 (PDT)
From: maniacbug <maniacbug@ymail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
MIME-Version: 1.0
Subject: Yocto on Pandaboard FTW
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
X-List-Received-Date: Sun, 22 Jul 2012 20:15:25 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi.=A0 Just wanted to say that I received my Pandaboard A4 in the mail yest=
erday, and this morning core-image-minimal and core-image-sato are running =
great, using the following configuration.=0A=0AOE Build Configuration:=0ABB=
_VERSION=A0=A0=A0=A0=A0=A0=A0 =3D "1.15.1"=0ATARGET_ARCH=A0=A0=A0=A0=A0=A0 =
=3D "arm"=0ATARGET_OS=A0=A0=A0=A0=A0=A0=A0=A0 =3D "linux-gnueabi"=0AMACHINE=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "pandaboard"=0ADISTRO=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 =3D "poky"=0ADISTRO_VERSION=A0=A0=A0 =3D "1.2"=0ATUNE_FEATU=
RES=A0=A0=A0=A0 =3D "armv7a vfp neon cortexa9"=0ATARGET_FPU=A0=A0=A0=A0=A0=
=A0=A0 =3D "vfp-neon"=0Ameta=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =0Ameta=
-yocto=A0=A0=A0=A0=A0=A0=A0 =3D "master:cda59a9fb77544c85410cc6192e37e7c8d4=
c6e44"=0Ameta-ti=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "(nobranch):30fb40ebc136=
14a74c2e237927c60ac43e01d1bc"=0A=0ASato came up great on my 7-inch 1280x720=
 display, and I've spent 30 minutes playing 'bridges' :)=0A=0AI noticed in =
earlier postings that using meta-ti and poky together is still somewhat new=
 or under development.=A0 Is there anything I should test or try out to hel=
p the effort along?=0A=0Am.b=0A

