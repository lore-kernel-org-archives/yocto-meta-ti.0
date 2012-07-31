Return-Path: <maniacbug@ymail.com>
Received: from nm29-vm3.bullet.mail.ne1.yahoo.com
	(nm29-vm3.bullet.mail.ne1.yahoo.com [98.138.91.159])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id ACD22E00288
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 17:51:22 -0700 (PDT)
Received: from [98.138.90.50] by nm29.bullet.mail.ne1.yahoo.com with NNFMP;
	31 Jul 2012 00:51:21 -0000
Received: from [98.138.89.251] by tm3.bullet.mail.ne1.yahoo.com with NNFMP;
	31 Jul 2012 00:51:21 -0000
Received: from [127.0.0.1] by omp1043.mail.ne1.yahoo.com with NNFMP;
	31 Jul 2012 00:51:21 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 862412.43552.bm@omp1043.mail.ne1.yahoo.com
Received: (qmail 85329 invoked by uid 60001); 31 Jul 2012 00:51:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024;
	t=1343695881; bh=n4JUHPy48+8DovdL9zOc5F9Enj7WMlZM1iFJj9LxCJE=;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=kVomGKJrsjgn5WTvjb1ETO0Nt9TCGSmIlYZb9sDTBRcJo2TpTRvmFcK8jeno4hRrs9F0SQOczGq6Op7i2tCwTbXnpOORD4drea7ltUTCrFyjFHWHxz22vgmd5lJMC0n1h4kSecTZ8pf5078yxzKZ5kxhtdl7nLoO8gEn9wH2IQw=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=ymail.com;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=kEtLMt6tuBbN4J4xIQ+TWSc+L1Txe5cmHGnAN2GNJ6kzaU0GppviKAnxeMGq6cipdF8klsjbZmHbtuwgio0XOFb3J5q69U77wwlpvUkXyNBp7akrRyeHG+bQNtNaNuLZWnYV1Xx4MKBiWZQIunpmwBSwE2ugviTlkEgDv25m/Lw=;
X-YMail-OSG: SZ1DwS4VM1mtIFQ69acCD2nG99Xf2xs.CKCnQ.SNrskR5hj
	SpS1y5E5n5J1vicpqNDguV287ApPnQ5TFgEqLnpAmRv5t6kHdZJHVb4LEHwu
	N7wFe5Ps1.r6blc1TzHECKG1V8BrcZiPNXaF.Cbr.jZiRNn7w.M1UUqgWyB1
	gxpzxrXeezbLeBZaSVD9rG8ggbNmCJzAkLAyqo.HX07dwz8N6eFzIeUR8M95
	KT3uB.OYlZZ00I8ErR2FKVkmjbJ5EEryfzhYt3Fiej8NPZ7oxRRgsm.Vf2_m
	1VzuhqkCfUYqPuQpEesJuWb7tpRshBxLepUmKU4VRAcXh4bq74f5U_gaWymG
	Y1dD.x0fP8llKyrK_ZWljndx60tCIYUHJ6Wd_IlpCJGKM_Xrdo5K85uIYfQ5
	tlI_9LHWtIrld55Hk7hjMsO7rjMPyVXJVm52Gq57TcGsVH6NODcgcI1QKXS_
	wcS70hLC38Tu7C3m.YlI8APCaUCs5VB6d_rz_6KiFBH.E3idwNXrmAfCLwNG
	IeM9kziT6Jt7r8c.Bh7Sla3UDnvixG7BfVkzf1nqGrF_LfSyrMlRUvpFUubQ
	oMH863ZhGtkeWBhrnNHuCVlKLqXp78fOTApgxZ0_DKHP9Ced351itnnkQELJ
	HLQLbxBtILO_DBOH9FMBpJJFLXMuljA--
Received: from [50.135.220.100] by web121606.mail.ne1.yahoo.com via HTTP;
	Mon, 30 Jul 2012 17:51:21 PDT
X-Mailer: YahooMailWebService/0.8.120.356233
References: <1343681420.8942.YahooMailNeo@web121606.mail.ne1.yahoo.com>
	<20120730223150.GD23003@edge>
Message-ID: <1343695881.68108.YahooMailNeo@web121606.mail.ne1.yahoo.com>
Date: Mon, 30 Jul 2012 17:51:21 -0700 (PDT)
From: maniacbug <maniacbug@ymail.com>
To: Denys Dmytriyenko <denys@ti.com>
In-Reply-To: <20120730223150.GD23003@edge>
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Sound on Pandaboard?
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
X-List-Received-Date: Tue, 31 Jul 2012 00:51:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> one of the options would be to look into latest code in this repository:=
=0A=0A> http://dev.omapzoom.org/?p=3Dintegration/kernel-ubuntu.git;a=3Dsumm=
ary=0A=0AOk, lots of good hints there, thanks. For one, video DOES work on =
Linaro-built Ubuntu images, so seeing that the kernel comes from Ubuntu is =
a hopeful sign.=0A=0ASecond, I can pay more attention to Ubuntu/Linaro bugs=
, like this one: https://bugs.launchpad.net/linaro-android/+bug/852314 . Th=
e comments on that bug describe hoooking up the (missing) audio routing. Do=
ing that, I can now hear audio in some cases hen playing video. gst-launch =
plays audio fine, but super slow video. ffplay plays the video properly, bu=
t no audio.=A0 Getting there.=0A=0A> I would recommend looking into one of =
the latest branches in =0A> the above integration tree.=0A=0ARight, I will =
dig around for the latest updates here and see what turns up. Thanks!=0A=0A=
m.b=0A

