Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24486E00344
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 14:16:17 -0700 (PDT)
Received: by vcbgb22 with SMTP id gb22so3262042vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 14:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WKuZR4uqnhpe1VqGpx37zebKGLjaS3rU7DwwTX5NmiM=;
	b=KaMqbyQjLQ4M4UTKlkLhYFuzu+Bq4f/EzlkOqdE9D2pxG3XqyyvFf/5XejHNAPnSQe
	J5jMpHMoQ4cg6PVUr1AR35/g+TTfDQtj7r1ej3bBZRhLzuEgqFzL4xUt22P/9BOiZcZa
	Awxq5guMU8KheOoRCWbo0Rmr87Pfiu5nMse8mV5mtWHHwoPgEk+LK190abLuuFGv/I3k
	LqdjH+EsAmuivuovKVCT9NUQa7mjB54MqKq2KL4X2nLjZmSQBqKpPasCzPub/wkZe5zc
	ENk7MqbqNRQmJW/g6Q6DYPpIhs5sqVx+POqWt6ej2N60aADJwOVO/3Sdg5TmXWlvXt2X
	luCg==
Received: by 10.220.142.5 with SMTP id o5mr2862076vcu.49.1348780576208; Thu,
	27 Sep 2012 14:16:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 27 Sep 2012 14:15:55 -0700 (PDT)
In-Reply-To: <50647F76.6020109@mlbassoc.com>
References: <506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
	<CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
	<CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
	<506479FF.8050305@mlbassoc.com>
	<CAMKF1sp1dD7qoaQ=JpM_RmgZS65GRKcUcBka9q=0TWbtAzEVHQ@mail.gmail.com>
	<CA+2YH7ssSvi323th0dHxP_wzB9H7he23HuhvtKNbAzb+K_n-Fg@mail.gmail.com>
	<20120927162455.GA7653@edge> <50647F76.6020109@mlbassoc.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 27 Sep 2012 23:15:55 +0200
Message-ID: <CAOT3miL737wkzsNdfO38VrYJMf5K57-g3_ZCQji_HV0+y56b3A@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
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
X-List-Received-Date: Thu, 27 Sep 2012 21:16:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 27, 2012 at 6:31 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> I build the Panda kernel (based on the latest TI/Ubuntu tree
> ti-ubuntu-3.4-1485.7 branch)
> all the time with the Yocto toolchain & it works just fine.
>
> I also tried the off-the-shelf 3.1.0 which worked as well.
>
> There must be something odd about the 3.1 kernel built from the
> linux-omap4-3.1.0
> recipe which is the default when built using Yocto+meta-ti

i don't think there should be any valid reason to continue with this
old kernel. first there isn't anyone who maintains that branch (my
team maintains that evil vendor tree). For Panda I would either
recommend to use to a more recent branch (like 3.4), in fact we might
even consider http://git.linaro.org/gitweb?p=landing-teams/working/ti/kernel.git
(branch tilt-3.4) as this is the base for our 'ubuntu' derived branch.
in fact for Panda, just mainline might be another option too..


>
> n.b. this is the end of my experiments on this subject; I was only
> trying to help in case it was a toolchain issue since I have the old
> tools still around.

