Return-Path: <raj.khem@gmail.com>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2008E006DD
	for <meta-ti@yoctoproject.org>; Sat,  3 Dec 2011 13:14:15 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by lagv3 with SMTP id v3so2467891lag.35
	for <meta-ti@yoctoproject.org>; Sat, 03 Dec 2011 13:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=RGqQtg4FXuXJ9hGeGzpXe3Bqp/K8kk8uAHOcm92xtFk=;
	b=X/f570MxXPLOrsEQUwWjAjD5vXGZtp1F79VYDzER4GgUqsJOV2E8yt1cxrkWrEkHEA
	/413l99tuDIDP9FeXrZnx2kPOuVol0bwLiDTykBII2BqRMkZpEDd6OUoy9tUAPTqHFFC
	QHLgvq7R8HcmIlBQ79ndvsQ6YSy4rEvW5PTkc=
Received: by 10.152.122.34 with SMTP id lp2mr2273667lab.20.1322946853495; Sat,
	03 Dec 2011 13:14:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 3 Dec 2011 13:13:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Dec 2011 13:13:42 -0800
Message-ID: <CAMKF1spb7EReb9Zdjfarb7aoKTAcJ_eEL2jFTpytPm5NoVXGLg@mail.gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Sat, 03 Dec 2011 14:24:44 -0800
Subject: Use of MACHINE_KERNEL_PR in meta-ti recipes
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
X-List-Received-Date: Sat, 03 Dec 2011 21:14:16 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I am seeing this kind of error all over in meta-ti recipes


ERROR: Unable to analyse format of PR variable: ${MACHINE_KERNEL_PR}e
ERROR: Unable to parse
/home/kraj/work/angstrom/sources/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb

Problem seems to be that these recipes are not getting
MACHINE_KERNEL_PR from anywhere but they are using it
and its not a standard variable in bitbake.conf either. I have
manually patched recipes-ti/includes/ti-staging.inc
to contain MACHINE_KERNEL_PR ?= "r0"

and patched few recipes which did not include this include to have the
definition in them

I don't know if this is the right way to fix it but this has got me
over the parsing problems

Thanks

-Khem

ps: I am not subscribed to this mailing list so please CC me in responses

