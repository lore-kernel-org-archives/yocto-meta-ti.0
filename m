Return-Path: <tom.rini@gmail.com>
Received: from mail-pw0-f53.google.com (mail-pw0-f53.google.com
	[209.85.160.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23246E01217
	for <meta-ti@lists.yoctoproject.org>;
	Sun,  5 Feb 2012 21:41:02 -0800 (PST)
Received: by pbdu6 with SMTP id u6so5704491pbd.26
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 05 Feb 2012 21:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Hag0OJN8FN4xAYxRRM7D2GwVVlbg0wsWyltuy2mxcEg=;
	b=Mrcu6kylD7UaxutdktrST3jdM1mDkMHP06WO1hn/sP8L2vTJWLiCtVsERlqdXQXjw7
	wRDf8OGP6I0MIzOHj0g51LImOpkSiUOV+Jj+cpGIbn3RIC3LOFu+3CAl4DvVgsM9IFsO
	kP0poU1LcJHvwYQmM2Ehi4AhzEd/7uU/Y/6SY=
MIME-Version: 1.0
Received: by 10.68.72.138 with SMTP id d10mr43116498pbv.15.1328506861930; Sun,
	05 Feb 2012 21:41:01 -0800 (PST)
Received: by 10.142.237.1 with HTTP; Sun, 5 Feb 2012 21:41:01 -0800 (PST)
In-Reply-To: <20120206051350.GD8770@denix.org>
References: <1328309974-12634-1-git-send-email-tom.rini@gmail.com>
	<20120206051350.GD8770@denix.org>
Date: Sun, 5 Feb 2012 22:41:01 -0700
Message-ID: <CA+M6bXmbz-W7eAVT8v=_x4abaC1aMP1bb39JYDRfvFGvPnkqNQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Tom Rini <trini@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] beagleboard: Add fw_env.config
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
X-List-Received-Date: Mon, 06 Feb 2012 05:41:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 5, 2012 at 10:13 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Feb 03, 2012 at 03:59:34PM -0700, Tom Rini wrote:
>> From: Tom Rini <trini@ti.com>
>>
>> This adds a fw_env.config file that is valid for BeagleBoard's
>> with NAND for U-Boot environment.
>
> Tom,
>
> Does it conflict with NAND-less BB-xm, since all BBs share the same MACHINE
> config and override, hence masking the previously default fw_env.config?

No, because the mtd device won't exist in userland and the utilities
will simply error out.

-- 
Tom

