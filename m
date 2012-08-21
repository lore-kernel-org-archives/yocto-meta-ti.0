Return-Path: <jakes2@ovi.com>
Received: from nm19-vm4.bullet.mail.ne1.yahoo.com
	(nm19-vm4.bullet.mail.ne1.yahoo.com [98.138.91.179])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 71B60E00346
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2012 00:45:28 -0700 (PDT)
Received: from [98.138.90.55] by nm19.bullet.mail.ne1.yahoo.com with NNFMP;
	21 Aug 2012 07:45:27 -0000
Received: from [98.138.89.171] by tm8.bullet.mail.ne1.yahoo.com with NNFMP;
	21 Aug 2012 07:45:27 -0000
Received: from [127.0.0.1] by omp1027.mail.ne1.yahoo.com with NNFMP;
	21 Aug 2012 07:45:27 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 296570.2645.bm@omp1027.mail.ne1.yahoo.com
Received: (qmail 53996 invoked by uid 60001); 21 Aug 2012 07:45:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ovi.com; s=s1024;
	t=1345535127; bh=76L7IDYy4ZPtQGy+miCIqkVOYUuH4WRh0sdju1TLhzc=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=xftqfmLLTJ64NA9vF5f13aiSvHUCTY9FGbSjQF6eK2w6UoiyX/iQxPed16WyQHQQmzJ8HJo7ETgX7to8byFvVzQIoKBDCu7LQeGimoFihOdyfCOGKnjwTbKKOInp64hRb0rzNBmj0F7O8raidSyOAjJ++ER3QmEi8DstYyEP1bs=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=ovi.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=1H+AXsd3m1WK1TYYl93WqCbP2q23Q+NxoLDoyx/jfkcqkitSX+uf3OBmwEEIF4z5/umc3zTTs4rtib56qz7LjM85/Gy8OC43K3K5QcExM0d0+G+LxBI64RGayJOgmlEHSRvEz1gi9Jk85B/E66/wNHV7Ep5udOmtvIfT9PYGEOE=;
X-YMail-OSG: s_CORCcVM1n46ttIbk0CemdqM9JteYV6mjDNpAB5x8aFz2L
	sSF9QhEhe2.7IpeG640JZY1vyjRxzQ6oNc0hEhpSFZClWqAu8hBFxn5qrboR
	1Rxx.RYXji.f3lXyn6ciSMFocET7oeqMC7zVs0hf718kmStq_AwgK4vjXppW
	nwqCscadJGuqFLXBVsLlkpw9bEn3DdrOpgjONKIFcRvhz6Rh_lqjgGlbrlc7
	KAxpzuJVn2BZl2isHVqvp4qVs4tOKRUWT6Ux61bTHpHTKOIsNuR.QAjEtK.a
	QWaGnhzLBkDD.E0wlO25WXMP4RM5s4inEdMC1vW8LNFrAAAbklUuFbZWGda3
	MwBE1RJRsUHXmSHa37JWJKuGz9SKbcmcuzjl21tKtZyZ6ZvWZSpw4ROgGoJK
	fP.oR9oy46J2uE9G3qmjyDWMNTPb9W43_NaDbmqf7pIU-
Received: from [91.156.148.3] by web121206.mail.ne1.yahoo.com via HTTP;
	Tue, 21 Aug 2012 00:45:27 PDT
X-Mailer: YahooMailWebService/0.8.120.356233
Message-ID: <1345535127.49985.YahooMailNeo@web121206.mail.ne1.yahoo.com>
Date: Tue, 21 Aug 2012 00:45:27 -0700 (PDT)
From: jakes2@ovi.com
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
MIME-Version: 1.0
Subject: Linaro and CS ABI compatibility
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: jakes2@ovi.com
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 07:45:28 -0000
Content-Type: multipart/alternative;
	boundary="1735753853-465017608-1345535127=:49985"

--1735753853-465017608-1345535127=:49985
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello all,=0A=0AAs we all know, the Graphics SDK from TI is done with CodeS=
ourcery's toolchain and Yoctoproject prefers to use Linaro. So, here's the =
question:=0AIf I copy binaries from Imagination or TI's SDKs to my Yoctopro=
ject - will the binary libs a)work or b)is there some known restriction not=
 to use 'em c)we don't know - try it out.=0A=0AAs it turns out I'm already =
doing option 'c' but it takes some 4hrs to compile my Yoctoproject with met=
a-ti from scratch on this computer....=0A=0Athanks, Jarko=0A

--1735753853-465017608-1345535127=:49985
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:12pt"><div>Hello all,</div>=
<div><br></div><div style=3D"color: rgb(0, 0, 0); font-size: 16px; font-fam=
ily: times new roman,new york,times,serif; background-color: transparent; f=
ont-style: normal;">As we all know, the Graphics SDK from TI is done with C=
odeSourcery's toolchain and Yoctoproject prefers to use Linaro. So, here's =
the question:</div><div style=3D"color: rgb(0, 0, 0); font-size: 16px; font=
-family: times new roman,new york,times,serif; background-color: transparen=
t; font-style: normal;">If I copy binaries from Imagination or TI's SDKs to=
 my Yoctoproject - will the binary libs a)work or b)is there some known res=
triction not to use 'em c)we don't know - try it out.</div><div style=3D"co=
lor: rgb(0, 0, 0); font-size: 16px; font-family: times new roman,new york,t=
imes,serif; background-color: transparent; font-style:
 normal;"><br></div><div style=3D"color: rgb(0, 0, 0); font-size: 16px; fon=
t-family: times new roman,new york,times,serif; background-color: transpare=
nt; font-style: normal;">As it turns out I'm already doing option 'c' but i=
t takes some 4hrs to compile my Yoctoproject with meta-ti from scratch on t=
his computer....</div><div style=3D"color: rgb(0, 0, 0); font-size: 16px; f=
ont-family: times new roman,new york,times,serif; background-color: transpa=
rent; font-style: normal;"><br></div><div style=3D"color: rgb(0, 0, 0); fon=
t-size: 16px; font-family: times new roman,new york,times,serif; background=
-color: transparent; font-style: normal;">thanks, Jarko</div></div></body><=
/html>

--1735753853-465017608-1345535127=:49985--
