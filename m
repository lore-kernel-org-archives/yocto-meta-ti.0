Return-Path: <anton@advancedtelematic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DF6BE00985; Fri, 28 Apr 2017 07:19:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C52C6E00953
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 07:19:39 -0700 (PDT)
Received: by mail-wr0-f175.google.com with SMTP id z52so34590877wrc.2
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=advancedtelematic.com; s=google;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=OAjeC/Co53Kivfvu0fqq4YgBerNcAaJphprstHIyEik=;
	b=aNabe2H2XtHYuSiPYbcJuYujW5eyHku3MvoJT0Fhtca95KMsAfx8QqnmFL+7iZyPXp
	VoDZPB0zcmeJXrSn5ylSsWVi9485msteHlpq0D677QEqHHUTXOHn+MZYZyzMT1CnY2TA
	6D3yhQEroJowUh69my74UeJoZNmyRWcM8Op4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=OAjeC/Co53Kivfvu0fqq4YgBerNcAaJphprstHIyEik=;
	b=k/NLK3DUGcx26hAz8KKh894/B5kBgvq9YrZTfuQlsc4p2npFJiUHgVe7+VQygDrRJa
	Ef589aR31mDtmgfxUWxhUZSy8kL3lR8qd0tCPIQp7kMaDNWyHfgm+97sEw7E1V5p2kwD
	GWrxnLsGvq/dNNbKOpvyPZXwHVF00G50FUjDobjBDoRZOw3ZTBNmpci0X3vdKIuNTBMH
	4RBH2M5/YusIT1Br2smcR/eVh0i97EGYn8Go3GlNW4LYbBiJZIXBw9I3WSfDZhjhg8YG
	cudLCZbNCsptIViBZDl1/AV5cD3JROA8R3Mj7YWCBocwrP46SiuTJZSzxWY9MbrGck2D
	D5VA==
X-Gm-Message-State: AN3rC/6jS6Xx3/TxNuuNwO6sdCpWd/UXvauQaPS0/UB5A4mi+1Zc9RR+
	79RPTBuHED0yZckQqn8=
X-Received: by 10.223.178.236 with SMTP id g99mr7320737wrd.126.1493389178359; 
	Fri, 28 Apr 2017 07:19:38 -0700 (PDT)
Received: from [192.168.1.109] (p57bf9f95.dip0.t-ipconnect.de.
	[87.191.159.149]) by smtp.gmail.com with ESMTPSA id
	u66sm10749308wmd.24.2017.04.28.07.19.37
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Apr 2017 07:19:37 -0700 (PDT)
To: meta-ti@yoctoproject.org
From: Anton Gerasimov <anton@advancedtelematic.com>
Message-ID: <15a28d2c-ad70-6b82-0acf-8383a8b97b21@advancedtelematic.com>
Date: Fri, 28 Apr 2017 16:11:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
Subject: wlcore/wl18xx upstream vs build_wl18xx.sh
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
X-List-Received-Date: Fri, 28 Apr 2017 14:19:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

my question is not related directly to meta-ti, but it's the only ti
developer mailing list I've found. If you know a better place for it,
please share.

I've tried to build linux-ti-staging kernel from meta-ti with wl18xx
support and it kind of works, i.e. I can scan for available networks,
but can't unfortunately connect to any. I've learned that TI's
recommended way to build their wireless drivers is via build_wl18xx.sh
from TI's build_utilities, which uses a bit convoluted procedure ending,
as far as I could understand, with backporting drivers from TI's own
kernel branch.

So I wonder how different these are from the upstream, if it is possible
that my problems are due to using upstream drivers, and if there is a
recommended method to install these drivers inside Yocto, without
post-processing built images.

Thanks in advance,
Anton Gerasimov



