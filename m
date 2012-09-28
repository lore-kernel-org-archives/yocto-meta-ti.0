Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B634E00348
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2012 02:01:56 -0700 (PDT)
Received: by vbme21 with SMTP id e21so3661305vbm.35
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2012 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1EH9rFWL4EX+o0tMId/epSa2K47yDyUh6b5/aE8h5+k=;
	b=YVAO+AzYUcxovuzD1NdN6GYQ4igQA6WDgy+OosQJ40ssS4xVwrwWgbUikfDHiqepyC
	0eJNmXXsbaRHv4b8MJigd+8uBZBgfwhcDtJFN60t0BHCcedJ5CyPQmTKjo2cte1z1NJR
	vahNTZEIYWLHWNd8zaJn3wDt+fpDYk7J+9ZEyHmRP2jp185/wRyRTdMicx9rbjQ/nbIx
	2p1VcHgtEiv2QlU+KUifLC645Wy605rzP4Hj2AbCKNwyIuqe0eid5iGkSNoFlMaUNEie
	RpCQGg2YMY+ttH6UMMTwNpjyW//vifYLqIrsVF7mK1wdkKchpxQWXdkhF5jrQg/QiZP1
	4iIA==
Received: by 10.52.28.113 with SMTP id a17mr3016660vdh.47.1348822913632; Fri,
	28 Sep 2012 02:01:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Fri, 28 Sep 2012 02:01:32 -0700 (PDT)
In-Reply-To: <CA+2YH7snHG0xoPidXO_0RrdXfoD3p8Q-aY19BG2BxecXgVVeJw@mail.gmail.com>
References: <EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
	<CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
	<506479FF.8050305@mlbassoc.com>
	<CAMKF1sp1dD7qoaQ=JpM_RmgZS65GRKcUcBka9q=0TWbtAzEVHQ@mail.gmail.com>
	<CA+2YH7ssSvi323th0dHxP_wzB9H7he23HuhvtKNbAzb+K_n-Fg@mail.gmail.com>
	<20120927162455.GA7653@edge> <50647F76.6020109@mlbassoc.com>
	<CAOT3miL737wkzsNdfO38VrYJMf5K57-g3_ZCQji_HV0+y56b3A@mail.gmail.com>
	<20120927212854.GB7653@edge>
	<CA+2YH7snHG0xoPidXO_0RrdXfoD3p8Q-aY19BG2BxecXgVVeJw@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Fri, 28 Sep 2012 11:01:32 +0200
Message-ID: <CAOT3mi+uvBm6iM-PX+CDfA7h5F7FbaNWQkB4MAXZHth2us-Omg@mail.gmail.com>
To: Enrico <ebutera@users.berlios.de>
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
X-List-Received-Date: Fri, 28 Sep 2012 09:01:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 28, 2012 at 10:31 AM, Enrico <ebutera@users.berlios.de> wrote:
> On Thu, Sep 27, 2012 at 11:28 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>> On Thu, Sep 27, 2012 at 11:15:55PM +0200, Nicolas Dechesne wrote:
>>> i don't think there should be any valid reason to continue with this
>>> old kernel. first there isn't anyone who maintains that branch (my
>>> team maintains that evil vendor tree). For Panda I would either
>>> recommend to use to a more recent branch (like 3.4), in fact we might
>>> even consider http://git.linaro.org/gitweb?p=landing-teams/working/ti/kernel.git
>>> (branch tilt-3.4) as this is the base for our 'ubuntu' derived branch.
>>> in fact for Panda, just mainline might be another option too..
>>
>> Thanks, Nicolas!
>>
>> I'll give it a try with either of those trees and update the recipe
>> accordingly.
>
> Using linaro tilt kernel could be useful to add support for gst-ducati
> and friends more easily (using the dce firmware from their repository
> instead of building it from sources).
>

that's definitely what I had in mind too...

> Enrico

