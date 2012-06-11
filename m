Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD5D2E0044A
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 07:15:10 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so4688054bkc.35
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 07:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:x-enigmail-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=Jjpkq8SbI80sYCw8SaDC9q2IHOdPkkOP4XYfvtkodWc=;
	b=d69K88/2gseBOL+RxPrDYMkI/6aVCoMugwBzR5/Sq24EnC+BeqqNxFijpu6Y/ttGfk
	IsqNkyNmebKtUZcpfaktiVl4X3r3VbAdzUB12KQFvKTPXtr/L4ki3mfkjdf1XQq4IEGd
	zjbWq0MZv6uoL9K70u1tdeJMgdbBgbQ4whn0nIqx4UJeMKguylB+2H7Cyfah0pGgraeN
	nnbcjeVtmrnPzw2sfipnClAFe0Rl8P6+1eCfnpXy2US5NdADl5BUz4ZOkj4bpYzenaeD
	gc/iylLed+RZebIO3RA51E9O/MmG9Q660A+YiicMDsE3o4T7m1bcGS1K948xf/3WSeDz
	xwsw==
Received: by 10.204.154.80 with SMTP id n16mr10630715bkw.112.1339424109185;
	Mon, 11 Jun 2012 07:15:09 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPS id 9sm16595739bku.9.2012.06.11.07.15.06
	(version=SSLv3 cipher=OTHER); Mon, 11 Jun 2012 07:15:08 -0700 (PDT)
Message-ID: <4FD5FD69.8030604@dresearch-fe.de>
Date: Mon, 11 Jun 2012 16:15:05 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120427 Thunderbird/12.0.1
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
X-Enigmail-Version: 1.4.2
X-Gm-Message-State: ALoCoQm6dxMKSzrpv1Wj7ahzcM8UJl4pwCVzVPXNt63w4RH6csMHZmP5F/r4uH4QWnpoAciFy2f2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Tracking of Texas Instruments DM81xx related bugs
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jun 2012 14:15:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Because Texas Instruments is not able or willing to provide a useful issue tracker (not even for commercial customers like our company) we decided to track TI related issues for the DM81xx in our public HidaV github project. All TI releated bugs [1] are labelled with "Texas Instruments BUG" there.

We hope we can make the process of fixing these issues transparent to the community. And we invite all interested developers and DM81xx customers to help working on solutions for these problems.

[1] <https://github.com/DFE/HidaV/issues?sort=created&state=open>

Steffen Sledz

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

