Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98678E013D2
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:46:09 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so1739382vcb.35
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=guN61pGqALGCNWk76HJv4synWKxgbYaqSSkihiETW90=;
	b=dVKYURPEn5siqma/671XKJS6ImGqJAVsg3pvfR6dAPZqlt1ZxWeniR8zVECUG3PMns
	pyc4L8wVSEBzjtC+/5QlvFMXLB5LOAcvjuRIiB9axdmvfwe1TgNVExQGJkfCG0Irlys4
	jiA0xitQyVvYXJrxBWNJ2Z9xtCloETqE7dPrG9eFm+btXT/eobKuBJ/4AivFuA7RMkvD
	G6FRL1aQOq/wWDoUlwZrs161dtRSDTbyQ9shmX8Y2ykdu/CuH93ZDy1FchtS+NX74hg1
	1RwvGgTlef9wHStg5V5EVb5MquDSwl4NErspIy/ds/HiPKJTJ2EFbUFrkkeEZp7nRw4D
	19DA==
MIME-Version: 1.0
Received: by 10.58.231.8 with SMTP id tc8mr15390641vec.52.1349912766312; Wed,
	10 Oct 2012 16:46:06 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Wed, 10 Oct 2012 16:46:06 -0700 (PDT)
In-Reply-To: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
Date: Thu, 11 Oct 2012 01:46:06 +0200
X-Google-Sender-Auth: 9FCu0EyhAMqJUZtu9vZnacEDRVo
Message-ID: <CA+2YH7t7+XWaaf549x7JOkEpksAH6gTsZVdq=7qAZ8CYxmnmOg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/6] linux-omap4: update to ti-ubuntu-3.4-1487.6
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
X-List-Received-Date: Wed, 10 Oct 2012 23:46:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
> Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
> ---
>  recipes-kernel/linux/linux-omap4-3.4/defconfig | 4669 ++++++++++++++++++++++++
>  recipes-kernel/linux/linux-omap4_3.4.bb        |   17 +
>  2 files changed, 4686 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-omap4-3.4/defconfig
>  create mode 100644 recipes-kernel/linux/linux-omap4_3.4.bb
>
> diff --git a/recipes-kernel/linux/linux-omap4-3.4/defconfig b/recipes-kernel/linux/linux-omap4-3.4/defconfig

Note on the defconfig: i had problems with the default omap4 defconfig
so i took the config from latest geexbox kernel (based on
3.4.something) because i knew it was working.

I updated the defconfig with the newer memory requests for ipu and (unused) dsp.

Enrico

