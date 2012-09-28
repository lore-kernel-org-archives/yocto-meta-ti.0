Return-Path: <ebutera@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77FF4E00348
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2012 01:31:45 -0700 (PDT)
Received: by bkcik5 with SMTP id ik5so3160369bkc.35
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2012 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=XZ5G8kBXopYplHHwxxvz7uzm6dGxVIUmn8Gzbwyn458=;
	b=k+gSIW9/pV9h+eixRghIRam/lwPxSWkUdCvHmwKCfTIKw4Gz+/aPQcEBABKZZg91Nn
	x1PwvIQt6n6X0r2l3sDZGqF2d030T71du7r7TJXLmJG0gx+mMSEuHmQbHpkxS5Va7nGF
	jgVhCYCv/90+Ua6S+um4H26DEYj5Ir5F9Vg9m/LrKaNcoYBSGkh2CM41TEE1KFWN/Edm
	yRxJGjGNFHW1+56r5KSw9XWZQzk5WTBt4ssBqbJGklFUWQDo/eupDTAO6jKqB/OeBnV4
	txQJUpMk36TEBc1qW0idGWGLcjR8DGDJlF/Mm5QSxreFLskcrUD9YAMQPjhl/VEn6BOG
	T3cA==
MIME-Version: 1.0
Received: by 10.204.148.12 with SMTP id n12mr3184156bkv.62.1348821099785; Fri,
	28 Sep 2012 01:31:39 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.205.41.67 with HTTP; Fri, 28 Sep 2012 01:31:39 -0700 (PDT)
In-Reply-To: <20120927212854.GB7653@edge>
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
Date: Fri, 28 Sep 2012 10:31:39 +0200
X-Google-Sender-Auth: g8ewuKPciM8vEtwMaVF0y-si1YY
Message-ID: <CA+2YH7snHG0xoPidXO_0RrdXfoD3p8Q-aY19BG2BxecXgVVeJw@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Fri, 28 Sep 2012 08:31:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 27, 2012 at 11:28 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Thu, Sep 27, 2012 at 11:15:55PM +0200, Nicolas Dechesne wrote:
>> i don't think there should be any valid reason to continue with this
>> old kernel. first there isn't anyone who maintains that branch (my
>> team maintains that evil vendor tree). For Panda I would either
>> recommend to use to a more recent branch (like 3.4), in fact we might
>> even consider http://git.linaro.org/gitweb?p=landing-teams/working/ti/kernel.git
>> (branch tilt-3.4) as this is the base for our 'ubuntu' derived branch.
>> in fact for Panda, just mainline might be another option too..
>
> Thanks, Nicolas!
>
> I'll give it a try with either of those trees and update the recipe
> accordingly.

Using linaro tilt kernel could be useful to add support for gst-ducati
and friends more easily (using the dce firmware from their repository
instead of building it from sources).

Enrico

