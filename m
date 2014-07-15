Return-Path: <cliff.brake@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4B1FE006ED; Tue, 15 Jul 2014 08:44:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97204E00543
	for <meta-ti@yoctoproject.org>; Tue, 15 Jul 2014 08:44:19 -0700 (PDT)
Received: by mail-qg0-f54.google.com with SMTP id z60so3519994qgd.13
	for <meta-ti@yoctoproject.org>; Tue, 15 Jul 2014 08:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=428lp8Y28V4hh9RBcuUHChUp3L3khw3Tsmip2Vgwt4o=;
	b=ArwyVp2wIjBftHTmUL4iYcuvpCZvrcp9VdqIOu4oItPz8eu3MP1c8ymgRUblS0jVNo
	SDQGvliiKeqDGg8x4tqaUQHZyJlC7lTqovrZ+j16fp5UlDvtOG4fYaOpT7nS7iarHBRe
	XRLsQsYnYKBZw4YRqftIV9nYTB5K6gjZdJGTYYSJAkTiZP76r2VqB0dJlBzX3rdg6dhp
	bN75fAS9uyazBtJ7FGwyC9GpUbPU7nVK1zpcHRmjkbs/Cp6MA37qwWL5N0aqE8Ur6UvT
	7Tjej9mJ7sFJmC1jGNS65XmVEXVEK6mEkl1FrZsACyYFZzmWrgWMELXdtD5/y5uwGuQq
	VUAw==
MIME-Version: 1.0
X-Received: by 10.224.71.198 with SMTP id i6mr34138113qaj.76.1405439059136;
	Tue, 15 Jul 2014 08:44:19 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.17.19 with HTTP; Tue, 15 Jul 2014 08:44:19 -0700 (PDT)
In-Reply-To: <20140714202648.GX15788@edge>
References: <CAOd_LFxuEix6fEiRA8aA89OhR=tdPZTAp+NxfZAxA565Hirj_Q@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE73207ADE2@DLEE08.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE73207AE8F@DLEE08.ent.ti.com>
	<CAOd_LFysd8sM+-PU54eEDSNCs=A2tr83yMoZMvpQ-CsutwJCTg@mail.gmail.com>
	<20140714202648.GX15788@edge>
Date: Tue, 15 Jul 2014 11:44:19 -0400
X-Google-Sender-Auth: BBAWvbih724ibmqFAQa33uBUMVE
Message-ID: <CAOd_LFx5A933+DvXsQgs9n=wgjksJj5oRspgGufVy-7wGd+AYw@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [diasy] omap2plus_defconfig does not include systemd support
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
X-List-Received-Date: Tue, 15 Jul 2014 15:44:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 14, 2014 at 4:26 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Fri, Jul 11, 2014 at 12:24:15PM -0400, Cliff Brake wrote:
>
> That is interesting indeed. If they felt the need to overwrite the entire
> include file for the SOC, then they should care to keep it updated or set all
> necessary defaults. Otherwise they should have used a more unique name, like
> omap3-gumstix.inc and made necessary customizations in there, keeping the
> original upstream omap3.inc intact and using or not using it from their
> machine configs accordingly. For example, I've dealt with u-boot.inc in a
> similar fashion in meta-ti:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/u-boot/u-boot-ti.inc

Thanks for the ideas, I'll see if we can get meta-gumstix-community modified.

Thanks,
Clff

