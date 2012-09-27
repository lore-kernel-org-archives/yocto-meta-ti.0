Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBE4AE0027E
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 09:22:42 -0700 (PDT)
Received: by vcbgb22 with SMTP id gb22so2766443vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ArAoTD/N+nqMu/sFZg9CsmyXXjDP/TwvXr2l+06G4iU=;
	b=wfeWbFVizgAyolchgAEcSdTqyZg7iAd2s9bJl6aNi+S+5ADTmsx3YGOR/u891iHCg3
	mC+uNutfBJKlsdI48wzu4VAWwcwAUnueq0eV0IjHeS1Bbr9qhLyAO0H2GFldwGhAetic
	I3LIlfU01f3pSyKxvmYzCc+hz5pcT/EzPnCcko3Cu272X3h2ygbSUm3+zA3TW28LyG4B
	HJkc2YdPDKAGkhEMkepLxNM7T35PsYQkxcsMuHsohTMZAhsohlJEblAFWT897LrFQ733
	sDx3xwUtiGL+DKPjtZGwEdlLg0U9QMXs3adOt63NxWYmiEHkTMDJ0BEHsETYjd5uVt6s
	GCKQ==
MIME-Version: 1.0
Received: by 10.52.95.46 with SMTP id dh14mr1994299vdb.114.1348762962085; Thu,
	27 Sep 2012 09:22:42 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Thu, 27 Sep 2012 09:22:42 -0700 (PDT)
In-Reply-To: <CAMKF1sp1dD7qoaQ=JpM_RmgZS65GRKcUcBka9q=0TWbtAzEVHQ@mail.gmail.com>
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com> <5062FB00.7080307@mlbassoc.com>
	<506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
	<CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
	<CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
	<506479FF.8050305@mlbassoc.com>
	<CAMKF1sp1dD7qoaQ=JpM_RmgZS65GRKcUcBka9q=0TWbtAzEVHQ@mail.gmail.com>
Date: Thu, 27 Sep 2012 18:22:42 +0200
X-Google-Sender-Auth: QjrM-BO4wAEie5bIhHp_g1CmXgM
Message-ID: <CA+2YH7ssSvi323th0dHxP_wzB9H7he23HuhvtKNbAzb+K_n-Fg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 27 Sep 2012 16:22:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 27, 2012 at 6:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Sep 27, 2012 at 9:08 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>> I've tried this kernel on a PandaBoard, built with both GCC-4.7.2 (latest
>> master)
>> and GCC-4.6.3 (~denzil).  Both fail during to come up.
>
> OK you can take further step back and use edison SDK which has gcc 4.5
> which then can _kind_ of eliminate the compiler if it fails with all 3

Or take a step forward and try a newer kernel ;)

Enrico

