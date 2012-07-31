Return-Path: <maniacbug@ymail.com>
Received: from nm7-vm1.bullet.mail.ne1.yahoo.com
	(nm7-vm1.bullet.mail.ne1.yahoo.com [98.138.90.250])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D5230E00288
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 21:43:45 -0700 (PDT)
Received: from [98.138.90.53] by nm7.bullet.mail.ne1.yahoo.com with NNFMP;
	31 Jul 2012 04:43:45 -0000
Received: from [98.138.88.234] by tm6.bullet.mail.ne1.yahoo.com with NNFMP;
	31 Jul 2012 04:43:45 -0000
Received: from [127.0.0.1] by omp1034.mail.ne1.yahoo.com with NNFMP;
	31 Jul 2012 04:43:45 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 140586.32484.bm@omp1034.mail.ne1.yahoo.com
Received: (qmail 77133 invoked by uid 60001); 31 Jul 2012 04:43:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ymail.com; s=s1024;
	t=1343709824; bh=Dkc9LnDlkRWv4F/gjHmGXwqMdeKlPty2zrd7tRjn5zo=;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=jKw5SNCQkSCEEKsotX4XEb9dgpm+wUGrZWJ3M29UiM1IpAifXoc2FUcIMEb0oCKVxvieyVvKUdY4gHYakBn6RgDejit3gLolpbxpX/3CHI7jOqZRX0Zixc7/btIsNc0eJLNalDfN0kyW6i1FF8mF1rE6miKplmF0AyHQzVD/+uk=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=ymail.com;
	h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=VeC3AxQQGxp0MfhXieOh4EJ9+dQ0+7XEmUAlcV1VQ61/acXMwdI4uREgMQBQhkWHVI5Dvk1oQBukIYj08rvTjTs067uQKBqW4H+GQ4gPPNB2S/ZDrpDmu/kU0GhIXKs2G3zNZpWI5ExtAJCAQiiB1TYcqU9dM6+X5MqWrDM/G/k=;
X-YMail-OSG: mcqDVSoVM1mJ2Y_.F11EXdzz69QIaroOCPib_m50fOZW4FX
	Azb5zVqfClLYBRU34pdNRKh_fqXbfHl3g.bWI6U9Zj4HkcOxUtYYE.8QHsBN
	0Hph3T3_ND0esov0i98MpRDTH9Qs1ycQ7PONSMt2yajMHjEwqZZog8nTRgXT
	kj_G2M.F3glCBjC81lmGjU3OZzoHMeHvhPOj94Sf21NjW0F.4qD89g2BNZTm
	nvPi.oz6H6Ehuu4TIMXbIW9wpzekrQ4j65bRrmwG6rQCLRf2HbAb6LYZrh.g
	wPpQvGcDWo0l1K4ZBGmpo9N6w7P_hlPiXtoq5cIpEhjlz3ZmG1YvtkvC1wl9
	.u9yfA5dmEkbTV9tAMprdGlxFAQeHobYOZ34vxblNQfQpb6QiCAzzbfksKIK
	K_kVraENeQFfjrkIA4kgnk33hMogDZ8_3MSgwfP4WwIuv7I6nhgxuC1pmkzp
	QNTLHjwaB57vvTa5jZL1VbJ03I89jcZ5IQPTrOJsPB4traIivfUn_tJY1UQK
	MN2kNdI.JEEjIyP0ZDA--
Received: from [50.135.220.100] by web121605.mail.ne1.yahoo.com via HTTP;
	Mon, 30 Jul 2012 21:43:44 PDT
X-Mailer: YahooMailWebService/0.8.120.356233
Message-ID: <1343709824.69972.YahooMailNeo@web121605.mail.ne1.yahoo.com>
Date: Mon, 30 Jul 2012 21:43:44 -0700 (PDT)
From: maniacbug <maniacbug@ymail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
MIME-Version: 1.0
Subject: Reporting linux-omap4 compile errors
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
X-List-Received-Date: Tue, 31 Jul 2012 04:43:46 -0000
Content-Type: text/plain; charset=us-ascii

One last question (for tonight). Denys, can you suggest where to send bug reports for http://dev.omapzoom.org/?p=integration/kernel-ubuntu.git ? There are some obviously broken source files, so perhaps omap4 doesn't get tested very often.

m.b

