Return-Path: <raj.khem@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93571E00B2B
	for <meta-ti@yoctoproject.org>; Fri,  7 Mar 2014 13:16:07 -0800 (PST)
Received: by mail-la0-f52.google.com with SMTP id ec20so3217629lab.11
	for <meta-ti@yoctoproject.org>; Fri, 07 Mar 2014 13:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dTXdZeQA6Fx+Y825l2nE6wsoDYb4HXL6H/hNEoFdbrY=;
	b=BOIDLvYnJLrfC4h10JuteML9jvKfVSkIskdxzQGafjXspSAzzy9bsi58gAhqG1Q8yk
	XjgOFw+5n8nhywlMniKqBMzHtRP0tkLUDGyWJLFCADUrkzCYc7bO0/wXu9mXqnqyL3Nu
	LGZe8TaSTBvlvgEjWlFQcZfbm+u7UPT+vxf26bRsqT5w0+W8hFVcfDh3uwOnyYfwfroD
	dsQojrf1bt96dX6PwqmPCz+qpOgtc20fo9LVnfqdBtzcj5wcJrkYwroIVUO/ID5RFMD2
	kU4e2NMWkoVAxnGK8Tj9Wjw3J3Ah8rHiZKtzFzfg7HaKnjOM+kpXaaqYjz5KysarkMnI
	B9wQ==
X-Received: by 10.112.94.229 with SMTP id df5mr1690439lbb.36.1394226966218;
	Fri, 07 Mar 2014 13:16:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.185.231 with HTTP; Fri, 7 Mar 2014 13:15:36 -0800 (PST)
In-Reply-To: <20140307211246.GS22125@edge>
References: <1394215241-14051-1-git-send-email-denis@denix.org>
	<CAMKF1sqiidoFYkyVyFBjcQ=qy2TKfgHaLL2b46TykWkyhf0wFA@mail.gmail.com>
	<20140307211246.GS22125@edge>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Mar 2014 13:15:36 -0800
Message-ID: <CAMKF1sqP28BYxuPSPNzDiTVQp6ZKONZkVmO9am_sXeXOoA2fVg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-mainline: add 3.14 mainline recipe
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
X-List-Received-Date: Fri, 07 Mar 2014 21:16:10 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 7, 2014 at 1:12 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Fri, Mar 07, 2014 at 01:03:23PM -0800, Khem Raj wrote:
>> On Fri, Mar 7, 2014 at 10:00 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>> > +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
>> > +PR = "${MACHINE_KERNEL_PR}"
>>
>> is it possible to get rid of MACHINE_KERNEL_PR
>
> What's wrong with MACHINE_KERNEL_PR the way it's used above?


Nothing is wrong, but since you have a new recipe newer version may be
you want to get rid of
additional variables ?

