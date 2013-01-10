Return-Path: <twoerner@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A236E00720
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 14:50:30 -0800 (PST)
Received: by mail-we0-f176.google.com with SMTP id r5so560376wey.35
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 14:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=H6oDe9s2+VONnTm5qq4X13pgPZVZ4mz+zFyzZhbEJ2M=;
	b=E/WtdPqfJxnpHW2uKbVMIE15GDfQKrnzJwfGIKScGbLuLRc2OnwRM2JT2TxAFfBUNM
	TY7ILQ6qVs6180iqbJYR2+1CT8g2l/vwHyy9GTyDyA/JiC3EPX1gDxpDffefe6nC+KWk
	cpI+musr8ONrMFQPWuzWBafIjTXMZvM1YM7nJ+TF7fYmO2moZX7pdn+SnqDX8PIAgJda
	kReKRJemHH9gqzLJu5ecJ/4dJo7CfzU8tFvzmUXqxexLZxBqu/SToq4GvB1nbbOWVDns
	r/IiAnfCrB97+WP/ayCxTXjg19+2WPxIShMnJ8Z/tVunblZGYU1d/7rVvPwgKf2BWasD
	qmdQ==
MIME-Version: 1.0
Received: by 10.194.9.197 with SMTP id c5mr117501920wjb.20.1357858229349; Thu,
	10 Jan 2013 14:50:29 -0800 (PST)
Received: by 10.227.132.205 with HTTP; Thu, 10 Jan 2013 14:50:29 -0800 (PST)
In-Reply-To: <50EED938.8080108@mlbassoc.com>
References: <alpine.DEB.2.02.1301100943340.32462@oneiric>
	<50EED938.8080108@mlbassoc.com>
Date: Thu, 10 Jan 2013 17:50:29 -0500
Message-ID: <CAHUNapTODZveoW70_tdODtLyc-fiEvwkZQXTd0tQfxQUqvF9-w@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: has anyone actually tested sdcard_image.bbclass?
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
X-List-Received-Date: Thu, 10 Jan 2013 22:50:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 10, 2013 at 10:07 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> Interestingly enough, the meta-fsl-arm layer also has an SD card image
> layout (class) which works perfectly and needs no magic to make it work.


Very interesting! Thanks so much for posting this information.

The meta-ti method uses a combination of losetup, sfdisk, dd, and
others to create its images (which is what I have traditionally used
to create my own images). losetup (for sure and probably sfdisk too)
requires privilege in order to work (which probably accounts for all
the messy setup).

The meta-fsl-arm method, on the other hand, uses GNU parted which
doesn't appear to require privilege and does away with losetup and
sfdisk.

I'm glad you posted this information as I'll now be converting my
scripts to use parted as well.

