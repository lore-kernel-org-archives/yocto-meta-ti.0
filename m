Return-Path: <ebutera@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39A94E00790; Thu,  9 Oct 2014 10:08:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.42 listed in list.dnswl.org]
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4885CE00749
	for <meta-ti@yoctoproject.org>; Thu,  9 Oct 2014 10:08:45 -0700 (PDT)
Received: by mail-oi0-f42.google.com with SMTP id a141so3843545oig.15
	for <meta-ti@yoctoproject.org>; Thu, 09 Oct 2014 10:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=aI5fNaJHLtnY7OXzZQvSVAAqwiuGiLHYxtiP+uNVS6M=;
	b=rPdCnj+VGkyHCnwaaHP+iYM7BPKlcF4zfGKX2huxjzKJwyvfBv/RG4IGWWSoHs4k4c
	zO3X594SYvVZb51yIJzhZ7PRL4/DAG5G/WIL+cxj2KsH0+uMgszyr96AE2h2tBhUkqiu
	REAk5o0F38SqAX4Fi4vdodI98HwQ5PI8giUadh/3l/W/d5tLDRJ0oO5G32inUhdrS9cz
	oJCUZRlQxjOMVzHdjc1TMVydLq7F+INY/xn3CAHdGRrUTdKt3H8zR1gwfQdjA1gvUKu7
	dKWKtYPcmeQbv+Yw+IfkuvEpZxvrD5kAXZ21IqQLK+sm9SpEe89WidXsTbgLTnBN4zP/
	NRgQ==
MIME-Version: 1.0
X-Received: by 10.182.38.138 with SMTP id g10mr25111155obk.21.1412874523969;
	Thu, 09 Oct 2014 10:08:43 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.182.103.169 with HTTP; Thu, 9 Oct 2014 10:08:43 -0700 (PDT)
In-Reply-To: <20141008180525.GS1731@edge>
References: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
	<20141008180525.GS1731@edge>
Date: Thu, 9 Oct 2014 19:08:43 +0200
X-Google-Sender-Auth: MR00JphwBqPsSYuWMSlTLkByglY
Message-ID: <CA+2YH7vdabpUyrvKT3oecHHDGxYaRkZkBXjsst3u=KL9MArCHw@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Javier Martinez Canillas <martinez.javier@gmail.com>,
	Enric Balletbo i Serra <eballetbo@iseebcn.com>
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
X-List-Received-Date: Thu, 09 Oct 2014 17:08:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 8, 2014 at 8:05 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Wed, Oct 08, 2014 at 03:47:43PM +0200, Enric Balletbo i Serra wrote:
>> Hi all,
>>
>> According to the README I know that probably these packages are unmaintained,
>> but these packages are still used for some of us with newer kernels. This patch
>> series fixes some build problems found when I tried to build this infrastructure
>> with a 3.17 kernel. With these patches I'm able to build and run dsplink examples
>> and gstreamer-ti to encode/decode some videos using the DSP.
>>
>> If you don't have any inconvenient maybe would be interesting add these patches.
>
> Thanks for the patches! Can you please provide a bit more details about the HW
> platform you are using these on. Also, we are slowly updating other components
> in meta-ti, that touch DSP, like IPC, etc. - please let us know if any of the
> new changes affect the old components or break anything for you. I can't
> guarantee we'd be able to fix or support older platforms within new components
> right away, but at least we should be able to preserve old versions of the
> required components for as long as they work. Please keep in touch. Thanks!

Yes please don't remove the old versions, they are still useful.
Actually it's incredbile they still work with just some patching.
The only "problem" right now is that those components are soft-float only.

For the record i tested these patches on an igep proton (omap3530) and
igep com module (dm3730).

Enrico

