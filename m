Return-Path: <eballetbo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2F28E0077F; Fri, 10 Oct 2014 02:32:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eballetbo[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.212.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D090E00744
	for <meta-ti@yoctoproject.org>; Fri, 10 Oct 2014 02:32:09 -0700 (PDT)
Received: by mail-wi0-f177.google.com with SMTP id fb4so1446821wid.4
	for <meta-ti@yoctoproject.org>; Fri, 10 Oct 2014 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=fLZItsjteX42ZJN96tL7YZlsG9p5td+oMLybcAOP5hU=;
	b=ySNwqT6fm4P76eFA5XC9M1tfM+oMDoC6//Dm+49+hWNT5kZiA6vxAzBKIx671i9aCa
	vUwvBd6wSt4CpGspT2T8/nQtcl3W3C9IaOs7/r2FaSFhwM8Gn/snOuFK47Ppkk73xLxZ
	fyyMDDBTBLTKIQAtU9eCz2Km+LrdF37QUa23nqz/J3mKfi4p45Ce9m5RsegCS4x6s+FG
	fCsEBJGYQ4iflJkq8rKOtgqa963qM9MOp1gb0nr+48MTD8gZS7OfjRtjS5/DyxG89rUY
	lnXQ2h8UFLDus/Fj05uTc2sFVKzcGhySCC8Xz3atvfBYK/a8U0/uF0xHtP4prsL0OJlB
	tWPQ==
MIME-Version: 1.0
X-Received: by 10.180.72.45 with SMTP id a13mr3614661wiv.50.1412933527767;
	Fri, 10 Oct 2014 02:32:07 -0700 (PDT)
Received: by 10.194.137.6 with HTTP; Fri, 10 Oct 2014 02:32:07 -0700 (PDT)
In-Reply-To: <CAFqH_51CqB6xkqYVQeT2xN=TwM2QkP59nEmEvEZBbf0bvcCfMw@mail.gmail.com>
References: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
	<20141008180525.GS1731@edge>
	<CAFqH_51CqB6xkqYVQeT2xN=TwM2QkP59nEmEvEZBbf0bvcCfMw@mail.gmail.com>
Date: Fri, 10 Oct 2014 11:32:07 +0200
Message-ID: <CAFqH_53yxs-RLm8hX=oP9eQsq5k36N3-uBH6yttj_0uVfDNYgA@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org,
	Javier Martinez Canillas <martinez.javier@gmail.com>,
	Enrico Butera <ebutera@gmail.com>
Subject: Re: [PATCH 0/3] Fix dsp related packages for new kernels
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
X-List-Received-Date: Fri, 10 Oct 2014 09:32:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Denys,

2014-10-09 9:17 GMT+02:00 Enric Balletb=C3=B2 i Serra <eballetbo@iseebcn.co=
m>:
> Hi Denys,
>
> 2014-10-08 20:05 GMT+02:00 Denys Dmytriyenko <denys@ti.com>:
>> On Wed, Oct 08, 2014 at 03:47:43PM +0200, Enric Balletbo i Serra wrote:
>>> Hi all,
>>>
>>> According to the README I know that probably these packages are unmaint=
ained,
>>> but these packages are still used for some of us with newer kernels. Th=
is patch
>>> series fixes some build problems found when I tried to build this infra=
structure
>>> with a 3.17 kernel. With these patches I'm able to build and run dsplin=
k examples
>>> and gstreamer-ti to encode/decode some videos using the DSP.
>>>
>>> If you don't have any inconvenient maybe would be interesting add these=
 patches.
>>
>> Thanks for the patches! Can you please provide a bit more details about =
the HW
>> platform you are using these on. Also, we are slowly updating other comp=
onents
>> in meta-ti, that touch DSP, like IPC, etc. - please let us know if any o=
f the
>> new changes affect the old components or break anything for you. I can't
>> guarantee we'd be able to fix or support older platforms within new comp=
onents
>> right away, but at least we should be able to preserve old versions of t=
he
>> required components for as long as they work. Please keep in touch. Than=
ks!
>>
>
The hardware that I'm using for test is the IGEPv2 board, is an
OMAP3-based board with a DM3730 processor very similar to beagleboard
xm. The patches work in this board and if I don't made anything wrong
are not intrusive.

Could you provide, apart of beagleboard, which machines should have
support for these DSP components in order to try to compile for these
platforms and assure that I'm not breaking anything ?

Cheers,
   Enric

>
>> --
>> Denys
>>
>>
>>> Enric Balletbo i Serra (3):
>>>   ti-dmai: Fix build with recent kernels and compilers.
>>>   ti-dsplink: Fix irq mismatch for kernel versions greater than 3.7.0.
>>>   ti-linuxutils: Fix build problems for kernel up to 3.17
>>>
>>>  .../dmai/ti-dmai/remove-unneeded-includes.patch    | 26 ++++++++++
>>>  recipes-ti/dmai/ti-dmai_svn.bb                     |  3 +-
>>>  recipes-ti/dsplink/ti-dsplink.inc                  |  2 +-
>>>  ...splink_1_65_kernel_3_7_0_fix-irq-mismatch.patch | 16 ++++++
>>>  recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb        |  1 +
>>>  recipes-ti/linuxutils/ti-linuxutils.inc            |  2 +-
>>>  .../linuxutils_2_26-cmemk-fixes.patch              | 59 ++++++++++++++=
++++++++
>>>  .../linuxutils_2_26-sdmak-fixes.patch              | 25 +++++++++
>>>  recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb  |  5 +-
>>>  9 files changed, 135 insertions(+), 4 deletions(-)
>>>  create mode 100644 recipes-ti/dmai/ti-dmai/remove-unneeded-includes.pa=
tch
>>>  create mode 100644 recipes-ti/dsplink/ti-dsplink/dsplink_1_65_kernel_3=
_7_0_fix-irq-mismatch.patch
>>>  create mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26=
-cmemk-fixes.patch
>>>  create mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26=
-sdmak-fixes.patch
>>>
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

