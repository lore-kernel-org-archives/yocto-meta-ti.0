Return-Path: <raj.khem@gmail.com>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAD24E006F2
	for <meta-ti@yoctoproject.org>; Sat,  3 Dec 2011 13:43:02 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by lagv3 with SMTP id v3so2473772lag.35
	for <meta-ti@yoctoproject.org>; Sat, 03 Dec 2011 13:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=zGFJCeL0Ra/VcHxs+KeORvTpZnW9h874iXvCrjHiTVU=;
	b=mDOLPgUtE17E+KXDIbOWjwrBCO2ktLpT5g8vvClh1EGK9pwuibzTsY2pf6jaPBgIir
	x1C5LslZb+hIXP+RFo6blUijucgm8gSLg7GG2InvIF9ke+4bsFZbQprBh3KWMBbKoAhl
	WBt6LqfBSHgAJo88/CPWK5JO+tPhYGG8DHRdA=
Received: by 10.152.134.179 with SMTP id pl19mr2320522lab.13.1322948581342;
	Sat, 03 Dec 2011 13:43:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 3 Dec 2011 13:42:30 -0800 (PST)
In-Reply-To: <CAMKF1spb7EReb9Zdjfarb7aoKTAcJ_eEL2jFTpytPm5NoVXGLg@mail.gmail.com>
References: <CAMKF1spb7EReb9Zdjfarb7aoKTAcJ_eEL2jFTpytPm5NoVXGLg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Dec 2011 13:42:30 -0800
Message-ID: <CAMKF1sr+w_5PtYQhi-p6epp+pAyJkHPbWwcWK1YUmwo6nqmHSg@mail.gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Sat, 03 Dec 2011 14:24:44 -0800
Subject: Re: Use of MACHINE_KERNEL_PR in meta-ti recipes
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
X-List-Received-Date: Sat, 03 Dec 2011 21:43:03 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 3, 2011 at 1:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> I am seeing this kind of error all over in meta-ti recipes
>
>
> ERROR: Unable to analyse format of PR variable: ${MACHINE_KERNEL_PR}e
> ERROR: Unable to parse
> /home/kraj/work/angstrom/sources/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb
>
> Problem seems to be that these recipes are not getting
> MACHINE_KERNEL_PR from anywhere but they are using it
> and its not a standard variable in bitbake.conf either. I have
> manually patched recipes-ti/includes/ti-staging.inc
> to contain MACHINE_KERNEL_PR ?= "r0"
>
> and patched few recipes which did not include this include to have the
> definition in them
>
> I don't know if this is the right way to fix it but this has got me
> over the parsing problems

btw. I am using qemuarm machine with angstrom distro on top of oe-core
and qemuarm conf does not define MACHINE_KERNEL_PR either

>
> Thanks
>
> -Khem
>
> ps: I am not subscribed to this mailing list so please CC me in responses

