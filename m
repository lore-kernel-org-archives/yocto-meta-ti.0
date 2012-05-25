Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C637EE01402
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 00:41:47 -0700 (PDT)
Received: by eaab16 with SMTP id b16so147541eaa.35
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 00:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=LAp+pKkMTSaKd21I7GITG2Gm49hnsQHTAl6WuLeJX1M=;
	b=JDrAfVk9BE2pd0TR+5MAWXUIZ0aSqlWc6sx4QpMEY3sTHYKPRk0MhtcIi+hnCal1JS
	PxdjuCiB05oDxr3sR5keN9WWY5zjGcHBGA6J+b/teOwP1UEFcw9KzeMk1GQeaZ1dz1E9
	0/3BcEK83fUFC43KOQCBM8SuCBW4lsssjacIr7g5osmUG9AzFHScpXrSUtsOP31fqOiS
	7qCTLW9Ie3M837AJ/wuXVgfVPGHFT5/H73LTRyxSwdKjbO5HvO00Z0qYARdXH26RFIYr
	ugkgbCRmYcTtXc3w+y/uXbyPwNCV0vscSFxzDLMuTHyV22irgY85I4K/oHlBi5MSoHGy
	CHfg==
Received: by 10.14.185.137 with SMTP id u9mr431128eem.219.1337931706130;
	Fri, 25 May 2012 00:41:46 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f16sm4100172eec.2.2012.05.25.00.41.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 00:41:45 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1337931107-21227-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 25 May 2012 09:41:42 +0200
Message-Id: <996B6B05-9F48-48CD-ABC4-069CEE87F38C@dominion.thruhere.net>
References: <1337931107-21227-1-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnL2LsXL0mO+TWinwmVgMsuS6mvoijQEhShOV8G85bDO9DfaK+P4kFeaDovp8+6XlO8jdc9
Cc: denys@ti.com
Subject: Re: [PATCH] ti-hw-bringup-image: disable sdcard image class
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
X-List-Received-Date: Fri, 25 May 2012 07:41:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 mei 2012, om 09:31 heeft Koen Kooi het volgende geschreven:

> The class breaks with the current genext2fs in oe-core.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Some more background: I have a partial rewrite of that class, Otavio has =
a complete rewrite of it and I bet there are more patches collecting =
dust somewhere. But I need something that works right now :)

regards,

Koen=

