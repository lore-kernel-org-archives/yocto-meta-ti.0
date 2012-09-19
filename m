Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBAFBE004AB
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2012 09:04:30 -0700 (PDT)
Received: by vcbgb22 with SMTP id gb22so1678086vcb.35
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2012 09:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=a8eO+Z+dhb3PfsoV+8zJBm1Ac9mD9b45K2ghTcQNrSc=;
	b=QLMlIM4el248jkZe9lFhdMD3k7rJm01tUnyY+GdnilfNnM1tS7Mzfj3OfVorJ6p47b
	d0dBFwKuUVMMWzjBzNrPTtl4YbrfPjcIeBaGIFLPf2/DCtGCYvFAhLFwdGA/qq1t9w7N
	CFFwuAeG2MSzqx+XCOJEVhgPTaaCG4YBSBuDh527AUmw0u8kNWcoFgNNshfm2c/G0gL5
	cnuxtZ7fjmOaRdOc1Awhlye9UzdydGGeyhSgYHGR2htvMAOqj5q9rd62BRYTxLt7OfBK
	kczkB+TY5VaXMVpeBvZCoqSOmOY4pG5+5itA4Bxo5LAQ0eaZtClAUyQx9inIZEokBJ07
	1AUA==
Received: by 10.52.100.5 with SMTP id eu5mr1770066vdb.34.1348070669964; Wed,
	19 Sep 2012 09:04:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Wed, 19 Sep 2012 09:04:09 -0700 (PDT)
In-Reply-To: <20120919135659.GA589@edge>
References: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
	<20120919135659.GA589@edge>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Wed, 19 Sep 2012 18:04:09 +0200
Message-ID: <CAOT3miK4MM-LqDC0AFuZh3hH145qrYoxW1w27P4dXRTCR2X=hQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: building yocto images with meta-ti
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
X-List-Received-Date: Wed, 19 Sep 2012 16:04:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

thanks for your answers

On Wed, Sep 19, 2012 at 3:57 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Wed, Sep 19, 2012 at 08:16:05AM +0200, Nicolas Dechesne wrote:
>> hi there,
>
> Hi Nicolas,
>
>> i was able to build a 'vanilla' yocto image using the yocto git repo.
>> then i wanted to add meta-ti layer. so i have done the following:
>
> First, a little rant... :)
>
> It's unfortunate, but this still causes lots of confusion. Some purists among
> us will say that is not Yocto, but Poky. Case in point - which "yocto" git
> repository you cloned from http://git.yoctoproject.org/ ?

so yes, I meant Poky. It was indeed quite subtle to me, and I didn't
realize there was a difference between yocto and poky ;-)

just to clarify, I had cloned:

git://git.yoctoproject.org/poky.git, commit
913944d904266bf90af0cad94b4f0fb3652bd29d (master)
git://git.yoctoproject.org/meta-ti, commit
9ef35da0c8ff3be8f37214e09d0fc1d4987a11fc (master)

and I had put in my local.conf:

BBMASK = "meta-ti/recipes-misc"

as per the README. I didn't find any other useful information in the
README, though.

is there a good wiki / doc that explains what each of this thing is:
OE vs poky vs yocto vs arago?

is that wrong to expect to be able to build a poky image by combining
meta-ti and poky.git?

>
> Same applies to a 'vanilla' yocto image, which does not exist. It would rather
> be useful to specify which exact image for which MACHINE you are trying to
> build. A little bit more detail is always helpful...
>
>
> And now to the resolution part. I see you already used BBMASK as prescribed in
> the README, since you get past the unset LICENSE error... The below error
> happens when you build for a MACHINE that is overshadowed by another BSP
> layer that does not define MACHINE_KERNEL_PR. This MACHINE_KERNEL_PR variable
> is set in MACHINE definitions of meta-ti BSP layer and then used in other
> recipes within meta-ti and different layers.
>
> In other words, you are trying to build for "beagleboard" machine, which gets
> also defined by meta-yocto-bsp layer, besides meta-ti. The solution is simple -
> you need to move meta-ti above meta-yocto-bsp in your bblayers.conf or just
> remove meta-yocto-bsp from the list, if you are not planning on building any
> of the reference platforms. That way you'll get the machine definition from
> meta-ti layer and not from meta-yocto-bsp.
>
> After that, core-image-minimal and some other images should build fine. Good
> luck!

ok, so based on the feedback, i have moved poky.git to denzil branch,
and meta-ti to denzil branch too. is that expected to be a good
combination?

my build has restarted fine... i will check the build when they complete.

>
> --
> Denys
>
>
>> - clone git://git.yoctoproject.org/meta-ti
>> - modify BBLAYERS in conf/bblayers.conf to add meta-ti
>>
>> i can verify that meta-ti layer is configured properly as
>> bitbake-layers show-layers shows it just fine (with priority 10).
>>
>> However parsing recipes failed with:
>>
>> Loaded 23 entries from dependency cache.
>> ERROR: ExpansionError during parsing
>> /work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb:
>> Failure expanding variable FILESPATH, expression was
>> ${@base_set_filespath([
>> "/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_1_24_02_09-${MACHINE_KERNEL_PR}e",
>> "/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
>> "/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
>> "/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
>> "/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
>> "/work/yocto/meta-ti/recipes-ti/local-power-manager/files",
>> "/work/yocto/meta-ti/recipes-ti/local-power-manager" ], d)} which
>> triggered exception SyntaxError: EOL while scanning string literal
>> (FILESPATH, line 1)
>> ERROR: Command execution failed: Exited with 1
>>
>> is there a particular commit in yocto that meta-ti requires?
>>
>> how do you guys generate vanilla yocto images with meta-ti?

