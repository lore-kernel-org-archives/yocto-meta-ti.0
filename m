Return-Path: <maniacbug@ymail.com>
Received: from nm10-vm1.bullet.mail.ne1.yahoo.com
	(nm10-vm1.bullet.mail.ne1.yahoo.com [98.138.91.75])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 25E35E01304
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 12:16:17 -0700 (PDT)
Received: from [98.138.90.48] by nm10.bullet.mail.ne1.yahoo.com with NNFMP;
	25 Jul 2012 19:16:16 -0000
Received: from [98.138.226.166] by tm1.bullet.mail.ne1.yahoo.com with NNFMP;
	25 Jul 2012 19:16:16 -0000
Received: from [127.0.0.1] by omp1067.mail.ne1.yahoo.com with NNFMP;
	25 Jul 2012 19:16:16 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 523754.28205.bm@omp1067.mail.ne1.yahoo.com
Received: (qmail 79867 invoked by uid 60001); 25 Jul 2012 19:16:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024;
	t=1343243776; bh=6tMJH4V22r1L8wGyBeH6nbqlMatYUIZ42EsCJi/n9EQ=;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=PdCt3VyNXWLat2GNCpqDW43gIqztiKrVNsib0sQmzGd8R9h/5t+c1SUsgPGdM2pTquS3zj/C4ZZGuRGmyPYljaBp0fnWYDgCui+fFRVvk8CDh7+L3RwB1TucFkIRSrVC5TsJ0QhlIzm8VUTxT59OcmOUddcf2+lMHcvI00f3piA=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=ymail.com;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=vJjpBmuV9jYdO0JXF+5Rnsa62MSdw1bV52TcXUdKhz0BUXWbrXwHaL+mGTcvu1TlvE05K7Sxz6Lk2aLQCvmBJwveYhpLDEVgm7JdMJHOescmvjr2PUfCFag8+zqONSbkTMVnrXXpS12SsBPT4R5rURtyk7jYIZmNAWcg5S3orS4=;
X-YMail-OSG: JWMqaTQVM1nfB67MR6lxRc38ALe03HUfruQmizTdDs99sVz
	pKM9C_p1h92TKJzcuCmkVs5YfZclfsUXkNfC_xHruvAlZn31Rl.D3m8x1c.z
	pGzkBl3KzTor_yd_KTK0IsJWEcweKhP1EjLZe1T8vVERg5vUBCNk5ZJpdAcl
	p3rdL6LX1w6McC.ehcLkqKHqm7f4AY9HiCE2F_T5RsbK4uhre_YR5tmJp7xQ
	0l06FPHMZJyCFuCdhiXRuDSy7xLkY5Lj2TPbZj4286na0CJzc2LvrkSAedwY
	qeAzqSAqMghFvg0gmKIZggKd5T.qE8e0.r5t8R8RQpZPhkiIZmOHx4xFMzuq
	x5L00s2cg0yD4IsFnb92gJdZlQQ6O_7_mPqDGEwxqkDDO4mKC2GCd1JZf.gN
	RMqpMnweHydubTKWQZ3_vzD64oHbumKPWkLtoQAZpGDvexOrE8rIp_eF8HaG
	Sdd7p9ONbd65ZYetp4JH62BNn92dtAX.KyKITY_h1xI6diaT1yWV8PL4XlML
	b_ncK7OiLoLzw4YHjtwt8fu7O42LGEJmZcTCjMs6Rsuoany5LaN70kaAxJ28
	RXtkfsJVCBVPyOK6L.DpnGh8-
Received: from [50.135.220.100] by web121603.mail.ne1.yahoo.com via HTTP;
	Wed, 25 Jul 2012 12:16:16 PDT
X-Mailer: YahooMailWebService/0.8.120.356233
References: <1343187414.7556.YahooMailNeo@web121605.mail.ne1.yahoo.com>
	<20120725051154.GC28778@edge>
Message-ID: <1343243776.71726.YahooMailNeo@web121603.mail.ne1.yahoo.com>
Date: Wed, 25 Jul 2012 12:16:16 -0700 (PDT)
From: maniacbug <maniacbug@ymail.com>
To: Denys Dmytriyenko <denys@ti.com>
In-Reply-To: <20120725051154.GC28778@edge>
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: omapfbplay depends on libav
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
X-List-Received-Date: Wed, 25 Jul 2012 19:16:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for writing back.=0A=0A=0A=A0> http://cgit.openembedded.org/meta-ope=
nembedded/tree/meta-oe/recipes-multimedia/libav=0A=0A=0AOh yes, there is is=
. =A0Ok, this is surprising. =A0I THOUGHT that OE and Yocto shared the core=
 layer, but clearly not. =A0recipes-multimedia is significantly different b=
etween the two.=0A=0AAlso, this libav recipe has the following horrible lin=
e :) =A0This leads me to believe no one is running omapfbplay on A9, like P=
andaboard.=0A=0AEXTRA_FFCONF_armv7a =3D "--cpu=3Dcortex-a8"=0A=0A=A0> gstre=
amer?=A0=0A=0ADoes gstreamer come with a simple tool in /usr/bin? =A0From t=
he recipes I'm looking at, it seems gstreamer provides only libs. =A0On des=
ktop linux, I'd use gst123, but that pulls in gtk+-2.0 which is more overhe=
ad than I want.=0A=0AUsing Yocto, gstreamer does install gst-launch, but I =
do not currently possess the knowledge to "build a gstreamer pipeline", AND=
 gst-launch is "primarily a debugging tool, you should not build applicatio=
ns on top of it."=0A=0AI'm looking for something which I can just exec and =
go, "<toolname> <mediafile>.m4v"=0A=0AThanks=0A=0Am.b=0A=0A=0A----- Origina=
l Message -----=0AFrom: Denys Dmytriyenko <denys@ti.com>=0ATo: maniacbug <m=
aniacbug@ymail.com>=0ACc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.=
org>=0ASent: Tuesday, July 24, 2012 10:11 PM=0ASubject: Re: [meta-ti] omapf=
bplay depends on libav=0A=0AOn Tue, Jul 24, 2012 at 08:36:54PM -0700, mania=
cbug wrote:=0A> But where does one find a recipe for libav? I've looked in =
Angstom and =0A> Yocto, but cannot seem to find it.=0A=0A=0A=0A> While I'm =
at it... I'm looking for a way to play mpeg4 or h.264 from the =0A> command=
 line. omapfbplay seems like the best choice. Does anyone have =0A> another=
 recommendation?=0A=0A=0A=0A-- =0ADenys=0A

