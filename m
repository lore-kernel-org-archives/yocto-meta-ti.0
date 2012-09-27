Return-Path: <ebutera@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45EACE00717
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 05:06:47 -0700 (PDT)
Received: by vcbgb22 with SMTP id gb22so2355378vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 05:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=tUXsMn7NaIeueNsUzwcmRybPOAav3TePcqXlIelcRwI=;
	b=mVn5vomcJRB0drKT3WmuRTwqPFQ/25vk4ek0a6VCiTrOEeHCs1tMG45FPl13HxbLKp
	/GrZTDWYcRKVOAe2+vqxMvInBi7covHFEk/qNwVL+vfnCT46DvQ9gUYqLeVzpfjB8Db4
	uV04qsBjKsvbqefcB1fiC9OV2iSy5VoEkEE8/vKf4d0XH8KeFRoHtLglqe9Z97f5Tobx
	JqOIUT+6gpUCsfVW3f7G9WOLw5pdFcDq01Z+TciIed6+cHSJ5VUQQTTQd19B/0zgJhp0
	qf15P2sxegGiim2lRgrOk3ZkUNffsrb4QZYN6WgFt+3tvJUvYetATVMybjYLQxOcvys6
	EePg==
MIME-Version: 1.0
Received: by 10.52.69.72 with SMTP id c8mr1766457vdu.37.1348747604175; Thu, 27
	Sep 2012 05:06:44 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Thu, 27 Sep 2012 05:06:44 -0700 (PDT)
In-Reply-To: <EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com> <5062FB00.7080307@mlbassoc.com>
	<506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
	<CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
Date: Thu, 27 Sep 2012 14:06:44 +0200
X-Google-Sender-Auth: Hf6cRrLScT3zjsvPozU6yF6-B9s
Message-ID: <CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Christian.Schulenberg@bmw.de
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
X-List-Received-Date: Thu, 27 Sep 2012 12:06:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 27, 2012 at 1:16 PM,  <Christian.Schulenberg@bmw.de> wrote:
> I'm using the same kernel version as I did before. It's the default kernel 3.1 as configured in the meta-ti layer: ti-ubuntu-3.1.0-1282.11, Revision: a5c60c099296fcfc0c8fa8085c40883971486512
>
> Do you really think it makes sense to switch to a more recent one?

No, but i have no better ideas right now...

You could check if it's a known toolchain bug with that kernel, but i
think it would be faster to try a newer kernel (from the same
repository, ti ubuntu integration).

Enrico

