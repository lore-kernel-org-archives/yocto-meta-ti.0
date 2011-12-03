Return-Path: <raj.khem@gmail.com>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6321CE006DD
	for <meta-ti@yoctoproject.org>; Sat,  3 Dec 2011 15:27:05 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by laho5 with SMTP id o5so7395lah.35
	for <meta-ti@yoctoproject.org>; Sat, 03 Dec 2011 15:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1lqfuUS7+oDIIP0rmU/fkE72p088Pgzfa8Z/llIaXnw=;
	b=vGDvJV979fSVoTRi4hEq2YvMDqxGOJ/4E7dmeEr6ePQWOWPJv2pF0p2kX3nZkF9zw2
	XA4eGDJ5saNiofOMNEeePaOl/YiliZ9pIWGL1nPkC9F5fwj+ZZm1hTY3gjhHBZWHGlTM
	8VJTd3UJukzY4SpXNewN2GpY20EcBgUpDGHCU=
Received: by 10.152.134.179 with SMTP id pl19mr2464962lab.13.1322954823438;
	Sat, 03 Dec 2011 15:27:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 3 Dec 2011 15:26:32 -0800 (PST)
In-Reply-To: <20111203231817.GC14132@denix.org>
References: <CAMKF1spb7EReb9Zdjfarb7aoKTAcJ_eEL2jFTpytPm5NoVXGLg@mail.gmail.com>
	<CAMKF1sr+w_5PtYQhi-p6epp+pAyJkHPbWwcWK1YUmwo6nqmHSg@mail.gmail.com>
	<20111203231817.GC14132@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Dec 2011 15:26:32 -0800
Message-ID: <CAMKF1sqxbhAVY8XNyts1-8qGYwnXoMzaJGHZuzuJOg4wsAXJ1w@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Sat, 03 Dec 2011 23:27:05 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 3, 2011 at 3:18 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sat, Dec 03, 2011 at 01:42:30PM -0800, Khem Raj wrote:
>> On Sat, Dec 3, 2011 at 1:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > Hi
>> >
>> > I am seeing this kind of error all over in meta-ti recipes
>> >
>> >
>> > ERROR: Unable to analyse format of PR variable: ${MACHINE_KERNEL_PR}e
>> > ERROR: Unable to parse
>> > /home/kraj/work/angstrom/sources/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb
>> >
>> > Problem seems to be that these recipes are not getting
>> > MACHINE_KERNEL_PR from anywhere but they are using it
>> > and its not a standard variable in bitbake.conf either. I have
>> > manually patched recipes-ti/includes/ti-staging.inc
>> > to contain MACHINE_KERNEL_PR ?= "r0"
>> >
>> > and patched few recipes which did not include this include to have the
>> > definition in them
>> >
>> > I don't know if this is the right way to fix it but this has got me
>> > over the parsing problems
>>
>> btw. I am using qemuarm machine with angstrom distro on top of oe-core
>> and qemuarm conf does not define MACHINE_KERNEL_PR either
>
> Ah, that explains it. Why do you need meta-ti layer with qemuarm? Is there a
> specific recipe you need from it or you are just trying all layers in default
> setup?

I am trying angstrom defaults. I think a COMPATIBLE_MACHINE is nice to contain
the recipes for your machine layer only so it can be used in default
angstrom setup
for non TI machines. Since I build TI and non TI machines in same
tmpdir I dont want
to keep editing my layers.txt every time I use a different machine

>
> --
> Denys

