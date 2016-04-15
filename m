Return-Path: <garg1387@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32260E00DF5; Thu, 14 Apr 2016 19:06:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (garg1387[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02153E00C51
	for <meta-ti@yoctoproject.org>; Thu, 14 Apr 2016 19:05:58 -0700 (PDT)
Received: by mail-io0-f195.google.com with SMTP id u185so13339419iod.2
	for <meta-ti@yoctoproject.org>; Thu, 14 Apr 2016 19:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=/pRA5sNhQgWtOhYy1JFmAwKIRR1VDR5hZ0wu+KQn6qs=;
	b=RMetgkz3GBSbfAXLLd2PLnLyX1xWidWa2OfQomNT8CJgJx+9c1+bGiPSIuBD7VKGc9
	sM0y7Qm+nKiw1MtQUIQY4frre90IzBLiDIlDeXWQjgQd4TGs+gkYaUjolL0+4aqtMOVI
	DdZRW5xpUUVcgLrrlK27K4X7sF+oQgGnFSAr4t1gf4L/8Zs0KS1qAI800r34iwxWG7Yh
	mhf23Y2ot8OF4a0jSLyVQ6N8XLqSgzQ5hcRXFMdLBFAofzEMq5yF3Maip2DeSJA83HZX
	aefewO3gwS0m6c0odCYLVwo8vVNOiivcSAv7SOs3PLojpJPtuaO8ya4jdDDH/aRmkZsj
	qHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=/pRA5sNhQgWtOhYy1JFmAwKIRR1VDR5hZ0wu+KQn6qs=;
	b=OapqvWZuQlsfn06D9yQhmfdrZTkj0luRieTDeNACZwd3vfqxMY6GnpICqtfNmy3Ucl
	Vow7QCCOXF9NiBnkWIWhAmkq5C1ygBxQQtAqY45qNka5vHbBSBq6GZK80Fqd864FOBuK
	s+5IcNMQ8+2+AVOHx7MT9JGGUj/gpxALrYum3B6Y9i3uSzWtazahpSpUmU9Nu7wQJ0cT
	u9HoCoc7zOwKvA+4KCGpbomkEbVtczRUQF7LigQt575RiyR9OnQZ5sw872k7L/JhSFI+
	z7XvYVSwYPFlS5DkQtOwZrxvwYJFQfASG9eatgLF31NEjQK4lhuH4PjGQ/tue1Hc+xjG
	NBzw==
X-Gm-Message-State: AOPr4FUBBj8cHpzekJ4KaZRFc9dsg64ebZ+xNFLRmrhZw4hIoZCl6u6SjVX8cAHcwu1HT+dMQl3XvcSR+mRWJw==
MIME-Version: 1.0
X-Received: by 10.107.6.214 with SMTP id f83mr22611728ioi.122.1460685957424;
	Thu, 14 Apr 2016 19:05:57 -0700 (PDT)
Received: by 10.79.130.199 with HTTP; Thu, 14 Apr 2016 19:05:57 -0700 (PDT)
Date: Fri, 15 Apr 2016 07:35:57 +0530
Message-ID: <CAC484MD-S_LFBnD90xyKKQPtsp82Qu1i_D_jnfW3Q4A09zge+w@mail.gmail.com>
From: akash garg <garg1387@gmail.com>
To: meta-ti@yoctoproject.org
Subject: regarding WL18XX cape
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2016 02:06:03 -0000
Content-Type: text/plain; charset=UTF-8

Hello everyone i want to use ti WL1835 cape with beaglebone black. i
just want to know how to enable this in yocto image - core image sato
am using latest yocto project core release Jethro.

