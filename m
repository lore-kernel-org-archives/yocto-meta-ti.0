Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BDA9E0127A
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 11:41:13 -0700 (PDT)
Received: by mail-vb0-f48.google.com with SMTP id e21so10821686vbm.35
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=QJxOnTLEQRxGpw8BHP+UuEP/57y8oJzNeJDXCheBo+g=;
	b=uhOT9uDwN9Hw3cMDwy5ngccJrK1JSWarKa5n9wFpXpbc6PuXOMdgaXZwWWesRrUdM5
	v9NWJNVYcHPULDGIlHSgNKVBcyzKppUaZndQX2YPlSvCibI2xoyi3aPpY4DeIjXaLdXt
	ZtkwW7Ah0aoiedOZbOClOSa0O57ARHv+ad6IJzu6BLIOrybH1yhUcPE5wLoWmpJ9EW7m
	YDwmAjNMlQ6GiAlUZF5UasphouSOgBlCWrXoak7XMN8IlHGqRJVKuHR6YhQw5tfzzUIM
	qqB1xFmWctlUENLmKY1K/FYRscTeJUzQOH+C6UjUlwzuGu4LiTcmwrul0abBYtkSEqyH
	nnLQ==
Received: by 10.220.119.196 with SMTP id a4mr6983487vcr.19.1350585672177; Thu,
	18 Oct 2012 11:41:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 18 Oct 2012 11:40:51 -0700 (PDT)
In-Reply-To: <20121018163149.GA20902@denix.org>
References: <20121018162306.343A752AB7@arago-project.org>
	<50802E0E.9000206@ti.com> <20121018163149.GA20902@denix.org>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 18 Oct 2012 20:40:51 +0200
Message-ID: <CAOT3miL=zqTZ2JmCfWbphJcgFW_uPzus2s0jkB+9pFiDkWkW+w@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: =?UTF-8?B?UmU6IEhlcnbDqSBGYWNoZSA6IGxpbnV4LW9tYXA0OiB1cGRhdGUgdG8gMy40IGZyb20gR0xQIDEuNi4gNiByZWxlYXNl?=
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
X-List-Received-Date: Thu, 18 Oct 2012 18:41:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 6:31 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Thu, Oct 18, 2012 at 06:27:58PM +0200, Herv=E9 Fache wrote:
>> In my tree, I kept the kernel and used Enrico's recent patches for
>> DCE/GST... Maybe some of them could be merged too?
>
> Yes, I'm keeping an eye on your tree and noticed you applied Enrico's pat=
ches.
> As well as couple commits from Nicolas. Please let me know the status for=
 all
> those from your perspective. I'll do some basic testing on my side, but i=
f you
> and Nicolas give your blessing for those changes, I'd be happy to merge t=
hem
> to meta-ti. Thanks.

at least for xf86-video-omap i need to make one change as I am missing
a DEPENDS on dri2proto. it builds today because somebody else might be
pulling that... I will refresh and send it to the list.

>
> --
> Denys
>
>
>> On 10/18/2012 06:23 PM, Arago Project git wrote:
>> > Module: meta-ti
>> > Branch: master
>> > Commit: 4f3522a9dc7f04e2f650199d66badb08dad214c6
>> > URL:    http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3D4f3522=
a9dc7f04e2f650199d66badb08dad214c6
>> >
>> > Author: Herv=E9 Fache <h-fache@ti.com>
>> > Date:   Fri Oct  5 14:57:42 2012 +0200
>> >
>> > linux-omap4: update to 3.4 from GLP 1.6.6 release
>> >
>> > Used Herve's version as a base with some mods from Enrico and addition=
al fixes
>> > on top, defconfig is the validated one from GLP release.
>> >
>> > Signed-off-by: Herv=E9 Fache <h-fache@ti.com>
>> > Cc: Enrico Butera <ebutera@users.berlios.de>
>> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >
>> > ---
>> >
>> >  .../linux/linux-omap4-3.4/pandaboard/defconfig     | 4152 +++++++++++=
+++++++++
>> >  recipes-kernel/linux/linux-omap4_3.4.bb            |   17 +
>> >  2 files changed, 4169 insertions(+), 0 deletions(-)
>> >
>> > Diff:   http://arago-project.org/git/meta-ti.git?a=3Dcommitdiff;h=3D4f=
3522a9dc7f04e2f650199d66badb08dad214c6
>> > _______________________________________________
>> > meta-ti mailing list
>> > meta-ti@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-ti
>>
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

