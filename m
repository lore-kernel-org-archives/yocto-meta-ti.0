Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50B98E00D84; Mon, 11 Dec 2017 16:53:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jpewhacker[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01298E00CEF
	for <meta-ti@yoctoproject.org>; Mon, 11 Dec 2017 16:53:12 -0800 (PST)
Received: by mail-it0-f47.google.com with SMTP id t1so20424285ite.5
	for <meta-ti@yoctoproject.org>; Mon, 11 Dec 2017 16:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9qGl5rbjpqxxz0FH8lt9dDunqGdteO+3eURXTvVXhPM=;
	b=qZt7y3l5EgSTC1Q7WGuF4nN9wMaR5se7HjAUAK9gjPTRes/FOqsdQL5SfSgNJByRDi
	0OSfrQ4g2xZOVm2OgyqpFLEayxHHnA/nd7WMOEpgOTN/6rUeIbR/ZpeFr52aecANG9tE
	r5BkKAdyYH7+JEKTSITQWgmK3hHX/KsMoh2ssyJ6D8Uy+Vj8TK288czbh8uv1kbu144/
	58c0N64m1NfBvg6KcilX1VUepwqZpYw1+ygYzjZezfVVIEZ1Iq6L+zcTwTFO3kpwFDo/
	xoeAxS0Gnrw0JcSpvwaDcub4rK0EWZwx/RKVyDNrGURI1dACWWTy4Ilvx/WoQJ50A/WF
	MelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9qGl5rbjpqxxz0FH8lt9dDunqGdteO+3eURXTvVXhPM=;
	b=GKqwyET4P9o4szVOTVrojuMG0gOptJoT+tHaRpS4B6RpB8nLHq21UJlb2M86iAN5Ml
	cwq2OPLaVN/sM/WlL/okPq9XdjzBl3W2CdEIb90/8SzIK+XmLIdlpqdPpHx4PjVGtOar
	WLNWTH6X6S2WSYBdPNsRAg3crMA9iZAZa4rROK/80oabFF52jJxVT1Ge9PwCihuBmCRB
	5hbMhmdeO1DTuYdYNZvmYDnjDxw6u03O1rKim9P5034WhJOunjLb0x+QoadhwWUGlh+1
	WgDpiVTrSyPqJJY74Rz1W2DSRAe67rw/OtAHxKAw/lTcyLayOS447Fr4jwzgNKO//tGl
	BPGA==
X-Gm-Message-State: AKGB3mJBQFIfTlf/u76+MgXT+iWz/z+BITP7pw0ty5chYLgEGzPhrG1j
	kJCy/k+PCWKzedlOTCDK0Bc=
X-Google-Smtp-Source: ACJfBov49ZXIxFnf0hqdYf4AtkmtRUYLZrWD2Hnsvbrq/z1g16C3w2dQhBGRVQUkela34ZPz39WIuA==
X-Received: by 10.107.29.11 with SMTP id d11mr3007391iod.201.1513039991828;
	Mon, 11 Dec 2017 16:53:11 -0800 (PST)
Received: from farscape ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.googlemail.com with ESMTPSA id
	l34sm6964827ioi.16.2017.12.11.16.53.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 16:53:11 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1513039988.18435.4.camel@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Mon, 11 Dec 2017 18:53:08 -0600
In-Reply-To: <20171211223916.GB27197@edge>
References: <20171128195856.28289-1-JPEWhacker@gmail.com>
	<20171211222857.17997-1-JPEWhacker@gmail.com>
	<20171211223916.GB27197@edge>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Cc: meta-ti@yoctoproject.org, "Mertz, Timothy" <timothy.mertz@garmin.com>
Subject: Re: [morty][PATCH v2] Make ti-xdctools a native recipe
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
X-List-Received-Date: Tue, 12 Dec 2017 00:53:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-12-11 at 17:39 -0500, Denys Dmytriyenko wrote:
> Thanks! Can you please detail the changes between v1 and v2 of the
> patch? We 
> are still investigating v1 of the patch and how it affects our
> releases...
> 

Sorry, just rebased and took the opertunity to add the branch specifier
(morty) to the patch subject since I forgot it the first time. There
are no functional changes.

I have cherry-picked this to master and it applies with some merge
conflicts. AFAIK it should work there, but I don't currently have a
sufficent setup to test on that branch. I can try to get one if you
want.

Thank you for looking at it,
Joshua Watt

