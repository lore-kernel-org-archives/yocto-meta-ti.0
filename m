Return-Path: <sladislov@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC475E00E04; Fri, 28 Oct 2016 01:15:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (sladislov[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.169 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.169 listed in list.dnswl.org]
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 306BFE00DBA
	for <meta-ti@yoctoproject.org>; Fri, 28 Oct 2016 01:15:37 -0700 (PDT)
Received: by mail-qt0-f169.google.com with SMTP id g32so39392746qta.2
	for <meta-ti@yoctoproject.org>; Fri, 28 Oct 2016 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=5w1hnFgH6jDKJKEfOV+EWjWkuyAHV6qsFhtkCRxx1gU=;
	b=FA7nyKGefTg4wRji1ydpGfFgesIioaKloJTjlz63dn/5lEz+WNjRqGUiJGcfEmf8kt
	wd+l0/rj3m2x+niz7/ooSPV8ajilX6rrlTMudNYLcc6bkgIeG/xGEBZvFAL2pCb50xCL
	ZQSD3N/ZiAyqblWzryRGtspMNLJhikcZg8Nww/XgazKO/4gFe3dlkTT1VKWuUnna18NX
	2vgkvAPbuBB87qm8rXWEBV1PvT90Jh5kr/XpPhSkbrS7bV3sMw917MRG2Y1nGRcJnzx8
	0QcR0BT0W9kLPTZlBZEScEIRsfKpKz1aczGe5rVp8c/qUokLLQbzIgBNi9/T1SNsLHmX
	IDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=5w1hnFgH6jDKJKEfOV+EWjWkuyAHV6qsFhtkCRxx1gU=;
	b=MMqeKMeDiTVpoyhg5Lx4n80GFpVhCb5Mtzd5rg28wXJsWJRfNibJAVJHWgS2L7vhrP
	hjE2LeVwCsffvs9fp40ulo+34nnWpyYPwcSOJRUhGKk+HKpCrLurwapyEKo5wOcaI6Zy
	ow0YYfYjdlkacAZVvD+F32tbVZVlA06wQvWfg3EP6s1/GFcVqpQNsXJTmpzkH7kTS17T
	1RREg15ly82ETLVMI1mMaGGyPdVxsYznad8T0iTqYjQf323jfWxs8g6EGnM8RTG+Akl2
	EN5SFQz/08p6bvyBMluSCs6f3qOz4r2BoNK2D5FciekcB194Q37+VRKwG2X0lS1jPXIw
	hsPw==
X-Gm-Message-State: ABUngveKdhai4bKNmMHb1PxRNk58O/e5KBsFDU+9GHNZkvlso7KddJeVnzeQ9YE1V29BAxCOmlSZO6jVYHrFkg==
X-Received: by 10.200.57.162 with SMTP id v31mr10281917qte.36.1477642536862;
	Fri, 28 Oct 2016 01:15:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.163.140 with HTTP; Fri, 28 Oct 2016 01:15:36 -0700 (PDT)
From: "Sladislov ." <sladislov@gmail.com>
Date: Fri, 28 Oct 2016 10:15:36 +0200
Message-ID: <CANisF-18t=XdC4D9qJwnC7+5qQXm0errPs0CG-wzih02_NKt6A@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Multimedia/Graphics image for Beagleboard X15
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
X-List-Received-Date: Fri, 28 Oct 2016 08:15:39 -0000
Content-Type: text/plain; charset=UTF-8

Hello!

I've been trying to get a yocto image up and running for the X15 with
multimedia/graphics capability. For now i've been manually appending
packages but isnt there a "ready to build" image somewhere?

-Sladislov

