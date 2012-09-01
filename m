Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACB85E00283
	for <meta-ti@yoctoproject.org>; Sat,  1 Sep 2012 06:11:45 -0700 (PDT)
Received: by wibhn17 with SMTP id hn17so2033293wib.11
	for <meta-ti@yoctoproject.org>; Sat, 01 Sep 2012 06:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6RB3uqFHOf8Me664/pbYtRQ+xHmY14HqM/V5SDX4mAQ=;
	b=fFgYBFni5t6+l0xhZ1YkwdAEvfmGRuLf37yCzJzmoGEoIcUzeX+neilpW1XGVx2gM7
	EH1CGn2Fnb0hdKOtrlqDEI2dDe2ScZ06Aqtd99pyLiylGQUROhAz5HWslVAbKRgaVEex
	s6ovPbCRna8LyPr/BvbTPQNXKlP3xS5fu4QprGd1yM0d+JbhrwNWRfVYZP6hyCwGf0wR
	jxFsf5ZEb5NEoV8CBgCMOUFglNMLFRSguGOmFPseQEuGx7VAkKZspD8Sq7OiOnCPIWM3
	Dgqr5gp6M0eBNk3XGAh9Kxwg+GP4IMmzyNYHvhEzQd6jdxIlja9hVHOuK67edAo+aSJe
	p3ow==
Received: by 10.180.74.33 with SMTP id q1mr11231128wiv.4.1346505104347;
	Sat, 01 Sep 2012 06:11:44 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id t8sm6950813wiy.3.2012.09.01.06.11.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 01 Sep 2012 06:11:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346500221-24295-1-git-send-email-koen@dominion.thruhere.net>
Date: Sat, 1 Sep 2012 15:11:40 +0200
Message-Id: <D5E7A137-2342-426E-981A-C0022EAE3342@dominion.thruhere.net>
References: <1346500221-24295-1-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlU0m0eRACIohbuI/N0E9BAli06Ahbw88jJAeYLe6qVhX3DlHMwgGYVZyPK/BnimxU6Y9fw
Subject: Re: [PATCH] beaglebone-tester: FTDI eeprom test, v2
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
X-List-Received-Date: Sat, 01 Sep 2012 13:11:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 sep. 2012, om 13:50 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

> Check descriptor instead of VID/PID

This applies on top of the other 2 bone-tester patches, the 'v2' in the =
title is a bit misleading, sorry about that.=

