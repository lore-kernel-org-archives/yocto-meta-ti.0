Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91499E013FE
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2012 01:44:47 -0700 (PDT)
Received: by vbme21 with SMTP id e21so4389747vbm.35
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2012 01:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BS4RM/p33+UgqIT+CTwZBdqE9mkhTKk5DkPJvf2qEn8=;
	b=AQi25Xass3i0RWmgu5MLsV27agXuUFloyLYhSB0wu+T3DHELzoAPcyCWWKlOmRBOgh
	FbPKVwJQgpaLza17lsFQOD/K8vgdCQjxS9wPRW0T4jE2YZif0SPM+1hdv5uuoUxcz+Z0
	Bt6MSTd81esUhES4ahLyVIO6hH5y4HfKFrVf4Kzg5TOhv7InJDCH0K39erDVwKTouJXo
	4+UaKeP1XYJpzZFbfVGMz0axrkIT/p9rI0dpCJFmhRdJDurvZ3aT4tdwA+TUXcVQklFR
	+DUxckl5RG8S87nmjpuWiJlyjgwrS9WPaAyaPTJq6wSWpNark531LKKtMqVKqjHWSzI0
	l3kQ==
Received: by 10.52.19.243 with SMTP id i19mr2099911vde.69.1348217082404; Fri,
	21 Sep 2012 01:44:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Fri, 21 Sep 2012 01:44:22 -0700 (PDT)
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E630DAF@DLEE09.ent.ti.com>
References: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
	<20120919135659.GA589@edge>
	<CAOT3miK4MM-LqDC0AFuZh3hH145qrYoxW1w27P4dXRTCR2X=hQ@mail.gmail.com>
	<20120919162639.GC589@edge>
	<CAOT3miK2M7e5AbYLevSqXD7vx7N_+FUY-8P6k4sFXu1Xxjd4sQ@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE72E630DAF@DLEE09.ent.ti.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Fri, 21 Sep 2012 10:44:22 +0200
Message-ID: <CAOT3miJNVxKj_v6=w4yT5Dq0MvuXn9COkmGCtL=9u846qoSkQA@mail.gmail.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Fri, 21 Sep 2012 08:44:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 20, 2012 at 2:22 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
> I think you missed my explanation - please re-read. I didn't say you should
> go to denzil, I said you need to update your bblayers.conf

ok.. thanks. I thought i had tried your suggestions... after a clean
rebuild, it did work.

so, just to make it clear I was able to build -minimal and -sato
images with this config

Build Configuration:
BB_VERSION        = "1.15.3"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "poky"
DISTRO_VERSION    = "1.2+snapshot-20120921"
TUNE_FEATURES     = "armv7a vfp neon cortexa9"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "master:df5f9a3e6dfcf8e8f57132843a024b44c0bd90fc"
meta-ti           = "master:7b288d7d05b803032e125f14a3a845c514728003"


>
> Denys
>
>
>
> -----Original Message-----
> From: Nicolas Dechesne [ndec13@gmail.com]
> Received: Thursday, 20 Sep 2012, 3:41
> To: Dmytriyenko, Denys [denys@ti.com]
> CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
> Subject: Re: [meta-ti] building yocto images with meta-ti
>
> On Wed, Sep 19, 2012 at 6:26 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>> On Wed, Sep 19, 2012 at 06:04:09PM +0200, Nicolas Dechesne wrote:
>>> hi,
>>>
>>> thanks for your answers
>>>
>>> On Wed, Sep 19, 2012 at 3:57 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>>> > On Wed, Sep 19, 2012 at 08:16:05AM +0200, Nicolas Dechesne wrote:
>>> >> hi there,
>>> >
>>> > Hi Nicolas,
>>> >
>>> >> i was able to build a 'vanilla' yocto image using the yocto git repo.
>>> >> then i wanted to add meta-ti layer. so i have done the following:
>>> >
>>> > First, a little rant... :)
>>> >
>>> > It's unfortunate, but this still causes lots of confusion. Some purists
>>> > among
>>> > us will say that is not Yocto, but Poky. Case in point - which "yocto"
>>> > git
>>> > repository you cloned from http://git.yoctoproject.org/ ?
>>>
>>> so yes, I meant Poky. It was indeed quite subtle to me, and I didn't
>>> realize there was a difference between yocto and poky ;-)
>>
>> It is somewhat convoluted, but in general, Poky is a reference
>> distribution
>> and released product built on top of OpenEmbedded-Core. The Yocto Project
>> is
>> an umbrella entity for different projects and initiatives based on the
>> common
>> infrastructure, such as OpenEmbedded-Core, BitBake etc. There are other
>> distributions and projects building on top of OE-Core, such as Angstrom,
>> Arago
>> etc., that are supposed to be part of the Yocto Project as well. See Yocto
>> Project branding compliance program for official guidelines, that were
>> standardized recently... But the Yocto Project Universe is much larger
>> than
>> Poky - there are at least 50 different layers that you can mix and match,
>> ranging from different BSPs to different Software stacks...
>>
>>
>>> just to clarify, I had cloned:
>>>
>>> git://git.yoctoproject.org/poky.git, commit
>>> 913944d904266bf90af0cad94b4f0fb3652bd29d (master)
>>> git://git.yoctoproject.org/meta-ti, commit
>>> 9ef35da0c8ff3be8f37214e09d0fc1d4987a11fc (master)
>>>
>>> and I had put in my local.conf:
>>>
>>> BBMASK = "meta-ti/recipes-misc"
>>>
>>> as per the README. I didn't find any other useful information in the
>>> README, though.
>>>
>>> is there a good wiki / doc that explains what each of this thing is:
>>> OE vs poky vs yocto vs arago?
>>
>> Some of that is explained above. I can go into more details offline, if
>> you
>> wish.
>>
>>
>>> is that wrong to expect to be able to build a poky image by combining
>>> meta-ti and poky.git?
>>
>> Absolutely not! And I've been building that combination among other things
>> -
>> either core-image-minimal or core-image-sato.
>>
>>
>>> > Same applies to a 'vanilla' yocto image, which does not exist. It would
>>> > rather
>>> > be useful to specify which exact image for which MACHINE you are trying
>>> > to
>>> > build. A little bit more detail is always helpful...
>>> >
>>> >
>>> > And now to the resolution part. I see you already used BBMASK as
>>> > prescribed in
>>> > the README, since you get past the unset LICENSE error... The below
>>> > error
>>> > happens when you build for a MACHINE that is overshadowed by another
>>> > BSP
>>> > layer that does not define MACHINE_KERNEL_PR. This MACHINE_KERNEL_PR
>>> > variable
>>> > is set in MACHINE definitions of meta-ti BSP layer and then used in
>>> > other
>>> > recipes within meta-ti and different layers.
>>> >
>>> > In other words, you are trying to build for "beagleboard" machine,
>>> > which gets
>>> > also defined by meta-yocto-bsp layer, besides meta-ti. The solution is
>>> > simple -
>>> > you need to move meta-ti above meta-yocto-bsp in your bblayers.conf or
>>> > just
>>> > remove meta-yocto-bsp from the list, if you are not planning on
>>> > building any
>>> > of the reference platforms. That way you'll get the machine definition
>>> > from
>>> > meta-ti layer and not from meta-yocto-bsp.
>>> >
>>> > After that, core-image-minimal and some other images should build fine.
>>> > Good
>>> > luck!
>>>
>>> ok, so based on the feedback, i have moved poky.git to denzil branch,
>>> and meta-ti to denzil branch too. is that expected to be a good
>>> combination?
>>
>> Depends on which direction you go. Denzil branch is usually considered
>> more
>> stable than master, although master is now feature-frozen for
>> stabilization
>> before the next release. Unless you start mixing meta-oe and step on to
>> systemd issues, as systemd in denzil is not that clean. Anyway, for a
>> simple
>> poky+meta-ti combination and images from meta/ directory it should be
>> fine.
>>
>>
>>> my build has restarted fine... i will check the build when they complete.
>>
>> Let us know. Like I said, I've been building both core-image-minimal and
>> core-image-sato w/o problems before.
>
> using denzil branch on both poky.git and meta-ti, i was able to
> generate a poky/sato image for beagle. thx.
>
> so what if I want to use poky.git master? is there a meta-ti branch
> that works in this case? I think this is what i tried initially (which
> triggered that email) which didn't work.
>
>
>>
>> --
>> Denys

