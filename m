Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B60BE00D90; Wed, 24 Jul 2019 08:51:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.173 listed in list.dnswl.org]
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CF73E00BAA
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 08:51:34 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id 44so14941025qtg.11
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 08:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Trosh91y5qqUxkEghIDeN067ZhVy5QsoDYWX6CA7cw4=;
	b=lb4xWVJAOdF9+h9nq7dwadP9TB0pGayqe/5bLPgDJV6DIVZUMCxV647dfcnYVwClOK
	IOlTYjVpmYicyEvolRKR/U1JRa01K/2hSjb/giQEJAzUTcA5oEg/sep12KwC3d3ItyzT
	oE4ipmLzYjUKFnMf69Ot3aqtHn4WOfH2gUexXPaR4gUEqhleeNmW1ynPytxa7Dlb8Fin
	pwh1s260DyyvllSSEgu4i+sJHDVLuRulrYxyRMb6DxtdHg4uNvLwDlY316i6AC/uRz91
	qYNT8ehjPVU4rpQpSnhCSMW9nggIJuwAbYemH9eVCTot6m4e9Dq+AQ5htDuY+cHWYyys
	fWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Trosh91y5qqUxkEghIDeN067ZhVy5QsoDYWX6CA7cw4=;
	b=dMug6V9I5FOLof+I07PjLu+MbCAIfn4tD6T8nB0o2ODD90f7RtIX8+cFxnQXR/aK/l
	68cV9xNRcnyDUORJTSDMNaBd2QERXTMHrPlFG1hgu709fXwsNu/fi8gOnmv+ud8jrikT
	fLaWSBZGfBsfd2QY/ZGyQ0EyKEYZUoCoaG3RaaLL5t8iHXXmd4mo594KengYjVFwpQeW
	gNB5m4KdWVdbjpSBDCZW5VlOjf6XOzHwRPhMY7tblzyyxDSgHXg1aGO4ouwK5EVvm97I
	COkXxx9vpPn5g7aBYsxfEwcfoHWQlXebAcoN5soG7grJoZS25DX9Iry8oqE7LsfMxxPH
	/N/w==
X-Gm-Message-State: APjAAAV1Jz1qKURevUZDXIls4ZAlz8Q53CdHzCSI8QF3qwqaeeI91NOs
	b5eD65Kh1UH2GSEmv2xxw9OVEk6GD/+T25ZEKW99xmTNVCM=
X-Google-Smtp-Source: APXvYqwg/oYouCyHAdLfCx2OO0GnMw13sqH28kxFKhzh1GotkTDBPt3z+iR7jIar4mBEAy+tgNKSi8jS7s+oG5DkCMQ=
X-Received: by 2002:aed:36e8:: with SMTP id f95mr57395551qtb.88.1563983493220; 
	Wed, 24 Jul 2019 08:51:33 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2019 08:51:06 -0700
Message-ID: <CAMKF1srNYsmfwbARgY==LJURLeno6twZd21K9kH4mH7rTkpyhg@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: WARNING: ti-cgt6x-1_8.3.2-r0 do_populate_lic: ti-cgt6x: No generic license file exists for: Patrick-Powell in any provider
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
X-List-Received-Date: Wed, 24 Jul 2019 15:51:35 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

Couple of recipes list Patrick-Powell in LICENSE filed but there is no
file pertaining to this license
in the license/ folder. This is flagged by build

WARNING: ti-cgt6x-1_8.3.2-r0 do_populate_lic: ti-cgt6x: No generic
license file exists for: Patrick-Powell in any provider

here are recipes


recipes-ti/devtools/ti-cgt-arm.inc:LICENSE = "(TI-TSPA &
Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 &
Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD &
BSD-4-Clause"
recipes-ti/devtools/ti-cgt6x_8.3.2.bb:LICENSE = "(TI-TSPA &
Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 &
Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD"

Thanks
-Khem

