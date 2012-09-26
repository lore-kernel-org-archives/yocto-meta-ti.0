Return-Path: <ebutera@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3472E0049F
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 02:20:10 -0700 (PDT)
Received: by vbme21 with SMTP id e21so429675vbm.35
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=VeUk9p836Mx/+ZZYD2+jU/HqVhMYMlsxwkQExAOSHPo=;
	b=ipVdHndDvb3MiL+loZz3+8gxvVyyLHZ1NCKDIekO38o2FH4xeH5xplfHhYkyyqpT3+
	b4bOoCcSapplRlxtk0CVeBwnMVl3e3Ov+F6mbjxM6gH83fBDk51rIAnpNRjX37r69DMI
	tzHyheYF2ABk73stJxCmxWWzv6ItKSuAWc56aHwPRQ83MSxhwy1mMmtxuUs71VPVc+9o
	FEbtF2AUVVR3R6CXx71u9GzkXy98Ooo6zldNY+4BckAZVb9cF6F54OcA/e1y6zveIeKQ
	IFTokPYOPnwyKUuxbdw8AmTyoik7YC5sVXVB3nfrbWgNyEhC58RmI2BOSbBoCxJApSgv
	6Wug==
MIME-Version: 1.0
Received: by 10.58.69.38 with SMTP id b6mr11019990veu.30.1348651207897; Wed,
	26 Sep 2012 02:20:07 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Wed, 26 Sep 2012 02:20:07 -0700 (PDT)
In-Reply-To: <5062B681.20407@intel.com>
References: <5061B4F0.3080505@intel.com>
	<5062B681.20407@intel.com>
Date: Wed, 26 Sep 2012 11:20:07 +0200
X-Google-Sender-Auth: QhCWtIBre8VbbzpyZKX6lh5nu74
Message-ID: <CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Radu Moisan <radu.moisan@intel.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard not booting
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
X-List-Received-Date: Wed, 26 Sep 2012 09:20:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 26, 2012 at 10:02 AM, Radu Moisan <radu.moisan@intel.com> wrote:
> Hi guys,
> Can anyone tell me if pandaboard is working with master branch of poky? I
> just don't want to waste my time figuring out what I've done wrong, if the
> build is not working anyway.

It's a long time since i tried it but it was working, can you post
your bootloader env? Maybe you are just missing the console=ttyO2...
part.

Enrico

