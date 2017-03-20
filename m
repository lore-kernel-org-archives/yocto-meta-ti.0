Return-Path: <gschmottlach@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80B5EE00AA7; Mon, 20 Mar 2017 11:14:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (gschmottlach[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.196 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66EF7E00AAA
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 11:14:03 -0700 (PDT)
Received: by mail-yw0-f196.google.com with SMTP id h11so14749671ywa.2
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 11:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GVM82b0JmGVa9A7neoxhbsDwyQMY24VOz9UCxcVFWu8=;
	b=HekxDCYujfK7OD3xjwhXO4ltESAXwysTYV0WHk26TQ8U9f6QmMIA3eL1n+vK0vW5BA
	YmlX3t0szHg2Nyt7SCPx+syq4veYN0N1PWrgGRJxVfLHPIrqByizFboZ/7ndqHnOBYj1
	lNdM4C/FzaJ6a8nQBIDH2coZPRd9Ts2kcdkml2VpIWvzFkErKXKchTB8Q754OelrwScc
	ZWrK5iVhJ3abjhqMWUyMok0osY9PsmDo4z5o9zjYvrsPa35C1MWfSgGv9xphPOfCESr3
	OOkaEGj5Ofbudbp5tUu51XouzIUpgCbs6A85ttqhIRfw/QM6VEvT8nL7iAGc2RHJH2km
	DRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GVM82b0JmGVa9A7neoxhbsDwyQMY24VOz9UCxcVFWu8=;
	b=N6/WEnES8J/ZsqJpObkInF+CSUwywfWbDdauI1FSNlfGgdJXE4tB/auduv030dVWRX
	ZtwMvEjBj8UF0YfaLzvt1QOZEJFiAzBKJv/ezUxbcx1+lYtiZaiGQlZ7QU2KyWzchIgQ
	DJWy4M1GPMpeRKnwjxEykMLc2QZAv9lmTvVEzci4MLDX1a4AuGdi/4cV3xN9LtO7NMUq
	XkizDcuSlqJ71zyJyu74hrM+DsuV8GtEvd2s3FyXDA/5kYNxbqzeKhkN15P0aIq13jPu
	sCz/KMHQMprPHTKhB/5cVx8uBUBw6wpbXOzKHXsP3I+8ufCzhramG7TXoq/aAiWqVuRT
	pSxw==
X-Gm-Message-State: AFeK/H1qydmJNlQy4rp4+WxZyVfouric1XzVXYVZSQ15beTVQMl9r0YRxUDZXVA3FfXq4kSL/KLAs/1ad2xCNQ==
X-Received: by 10.129.4.141 with SMTP id 135mr15768208ywe.349.1490033642399;
	Mon, 20 Mar 2017 11:14:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.95.139 with HTTP; Mon, 20 Mar 2017 11:14:01 -0700 (PDT)
In-Reply-To: <20170320155459.GP14484@edge>
References: <CAMS2kBEyHe6y3rKD0RV=LXnSXR8kQY7yHuHtBQrb5gvDiX4RCg@mail.gmail.com>
	<20170320155459.GP14484@edge>
From: Glenn Schmottlach <gschmottlach@gmail.com>
Date: Mon, 20 Mar 2017 14:14:01 -0400
Message-ID: <CAMS2kBE1mvJT5y=WiL1YvLY6-sdkCdZDvLMLL=i4wOqxA7QxXw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Trouble modifying defconfig for linux-ti-staging_rt recipe
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
X-List-Received-Date: Mon, 20 Mar 2017 18:14:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 11:54 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Mon, Mar 20, 2017 at 11:44:16AM -0400, Glenn Schmottlach wrote:
>> I am having trouble modifying the kernel configuration for the
>> following TI kernel recipe using the Yocto Morty environment:
>>
>> linux-ti-staging-rt_4.9.bb
>>
>> I have created my own layer and with a *.bbappend file for this recipe, e.g.
>>
>> linux-ti-staging-rt_4.9.bbappend
>>
>> It appears the TI kernel recipes are not (yet) proper "Yocto" kernel
>> recipes in that they are not "fragment" aware.
>
> TI kernel recipe is not "Yocto" kernel (which is really to say WindRiver
> format), but the fragment support got upstreamed to the mainline kernel and
> kernel itself now supports config fragments! That is what TI kernel uses and
> meta-ti kernel recipe supports.
>

Thanks for that clarification. I wasn't aware of the two "flavors" of
fragment support. It certainly would be nice if a consistent approach
(between Yocto and the Kernel) could be adopted. I suspect this will
be sorted out in time.

>> It appears I cannot do
>> the following inside of my *.bbappend recipe:
>>
>> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> SRC_URI += "file://eem.cfg"
>
> You can add any additional fragments you want to be applied by the recipe to
> KERNEL_CONFIG_FRAGMENTS variable.
>
>

This what I ultimately did . . . appended a fully qualified path to my
fragment to the KERNEL_CONFIG_FRAGMENTS variable. As a suggestion,
this might be something useful to include in the README for the
meta-ti layer. I suspect others might have a similar need to modify
the kernel configuration and once described, it (now) seems
straightforward.

>> Inside of "eem.cfg" I want to set the following kernel options:
>>
>> CONFIG_USB_NET_CDC_EEM=m
>> CONFIG_USB_F_EEM=m
>> CONFIG_USB_ETH_EEM=y
>>
>> This has no affect. I tried creating my own defconfig based on the
>> '.config' generated from the original recipe. I modified my *.bbappend
>> file as follows:
>>
>> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> SRC_URI += "file://defconfig"
>>
>> Again, my defconfig is not applied to the build.
>
> It already has file://defconfig in SRC_URI, that's how it works and gets the
> fragments assembled.
>
> What's your platform? Are you sure one of the existing defconfigs are not
> used instead?

I'm building for a BeagleBoneBlack so I expect it's using the
defconfig for that platform.

>
>> I even tried patching kernel-source/ti_config_fragments and placing a
>> eem.cfg in that directory hoping the configuration generation script
>> (defconfig_builder.sh) might apply this fragment.
>>
>> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> SRC_URI += "file://0001-eem-config.patch"
>>
>> Where the patch contains:
>>
>> Index: kernel-source/ti_config_fragments/eem.cfg
>> ===================================================================
>> --- /dev/null
>> +++ kernel-source/ti_config_fragments/eem.cfg
>> @@ -0,0 +1,4 @@
>> +CONFIG_USB_NET_CDC_EEM=m
>> +CONFIG_USB_F_EEM=m
>> +CONFIG_USB_ETH_EEM=y
>> +
>>
>> Unfortunately this did not work either.
>
> You also need to update the "map" file, which basically lists all the
> fragments it needs to assemble for a platform. And platform's defconfig only
> points to one of the entries in the map file.
>

Sorry if I'm a bit dense, but could you elaborate on this "map" file.
Where do I find it? What do I need to change? Do I need modify this
file in addition to modifying the KERNEL_CONFIG_FRAGMENTS as you
mentioned above?

Thanks for your patience (and help),

Glenn

