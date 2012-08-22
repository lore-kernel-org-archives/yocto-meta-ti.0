Return-Path: <raj.khem@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 455BCE00283
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2012 10:12:52 -0700 (PDT)
Received: by eabd1 with SMTP id d1so453721eab.35
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2012 10:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UQXC61G9pU3iEYxmck7a6zPrRV+hzMHEFEaaj+tLAR4=;
	b=Y2ZcBPH+SM7jojzyMxr/YZsDTh6hhdxNRYlOpv7TIbXUdIUlRNVeom4bWee95XfUnX
	D/rwrymuGPmeUx+W6p6EneuiinMPJ6yAUfoMcl0oYWYA8PExUdN0lxxlbxrQH0n/XXeT
	NVJDg+hnFe7ZTfsW/OML9e75xGM8zC20GIElqS8JTKkideR6F4bAFqNGUTSSwwFg3eX5
	cPrZreyW6J3tpvYUk7+A19dfoEupUHg3KgyJtk5K7Abt22jhJiA7cdfekViBo98pTd9+
	6/BVKWXuhVuUBJbgX1e1LhYw+rT2/dKe2YvcQb3W8k4qgYYVVimDIc60EK0Ckw8dWIDV
	cWjQ==
Received: by 10.14.4.201 with SMTP id 49mr19448259eej.0.1345655571442; Wed, 22
	Aug 2012 10:12:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 22 Aug 2012 10:12:20 -0700 (PDT)
In-Reply-To: <CAMKF1spkEvJNcs4fr75jbM9ByCFU__QfiJfZxQOjOUJ6hDdC0A@mail.gmail.com>
References: <1345646911-20898-1-git-send-email-raj.khem@gmail.com>
	<20120822152450.GA21025@edge>
	<CAMKF1spkEvJNcs4fr75jbM9ByCFU__QfiJfZxQOjOUJ6hDdC0A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 10:12:20 -0700
Message-ID: <CAMKF1sr469osqoDF+0Ey2xmyaGkC==RbTq9vf56ng1yGkdqQ4Q@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipes: Replace proto= with protocol= in SRC_URI
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
X-List-Received-Date: Wed, 22 Aug 2012 17:12:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 22, 2012 at 10:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> Koen should angstrom still use meta-ti from github or from git.yp.org
> for angstrom-next ?

on next branch on angstrom-scripts its using yp.org indeed my copy is
old and probably I danced between 2012.05 release
back and forth. Never mind.

