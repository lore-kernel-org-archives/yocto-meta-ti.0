Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE0A3E0049B
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2012 04:54:00 -0700 (PDT)
Received: by vbme21 with SMTP id e21so3805887vbm.35
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2012 04:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=KYncQfSIrplkFQjuL3Ex8OCG995jN+IEJxtdlU9625o=;
	b=q0U5vHB3V006Gn6KSMH8Pq12GvwccZYItMoBzb02tQu00VGMsQ3auXEsmCO2nbfUZO
	5ybKVOvioJlIYsyXRzUrgt/jYaKfRGom3bl6jVB6WmRBRIeV1euSYQPx9izmcfGkrlQ1
	uk6ghhxk5LjoiWkq+tdy4sm9giwLhVFiBbikp0bEp/CfczR6UvGKsxA3FFlmTRwsCWOp
	LO1s5eFs4Vy7Nsu+R6v1mdUpwgjWJPiL1F17ttdniKT5/lcH3FU5LorHvwvb2fcym42E
	bveRPe1u3JHI8etjs5k6f0ypzW1vY+5w6r/OxMzM1IyaCGjj+RoKRHfhvybe/i3knpYe
	mdvw==
Received: by 10.220.148.211 with SMTP id q19mr3906305vcv.55.1348833240013;
	Fri, 28 Sep 2012 04:54:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Fri, 28 Sep 2012 04:53:39 -0700 (PDT)
In-Reply-To: <EF446FF9DAC93B479C74AB9153DE173F1117D228@SMUCM08V.europe.bmw.corp>
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
	<EF446FF9DAC93B479C74AB9153DE173F1117D228@SMUCM08V.europe.bmw.corp>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Fri, 28 Sep 2012 13:53:39 +0200
Message-ID: <CAOT3miJcBnfy0S0QHiSWYcs8oQAcWzukH5zWW3ofbBdNiPSu-A@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Sep 2012 11:54:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 1:03 PM,  <Christian.Schulenberg@bmw.de> wrote:
> Hi,
>
> could you give me some advice, what kernel version of 3.4.x to try? Or do=
 you have an idea, when a recipe for a more recent kernel could be availabl=
e?

http://git.linaro.org/gitweb?p=3Dlanding-teams/working/ti/kernel.git
branch: tilt-3.4
config: omap4plus_defconfig


>
> BR,
> Christian
>
> -----Urspr=FCngliche Nachricht-----
> Von: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoprojec=
t.org] Im Auftrag von Denys Dmytriyenko
> Gesendet: Donnerstag, 27. September 2012 23:29
> An: Nicolas Dechesne
> Cc: meta-ti@yoctoproject.org
> Betreff: Re: [meta-ti] pandaboard not booting
>
> On Thu, Sep 27, 2012 at 11:15:55PM +0200, Nicolas Dechesne wrote:
>> On Thu, Sep 27, 2012 at 6:31 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> > I build the Panda kernel (based on the latest TI/Ubuntu tree
>> > ti-ubuntu-3.4-1485.7 branch)
>> > all the time with the Yocto toolchain & it works just fine.
>> >
>> > I also tried the off-the-shelf 3.1.0 which worked as well.
>> >
>> > There must be something odd about the 3.1 kernel built from the
>> > linux-omap4-3.1.0
>> > recipe which is the default when built using Yocto+meta-ti
>>
>> i don't think there should be any valid reason to continue with this
>> old kernel. first there isn't anyone who maintains that branch (my
>> team maintains that evil vendor tree). For Panda I would either
>> recommend to use to a more recent branch (like 3.4), in fact we might
>> even consider http://git.linaro.org/gitweb?p=3Dlanding-teams/working/ti/=
kernel.git
>> (branch tilt-3.4) as this is the base for our 'ubuntu' derived branch.
>> in fact for Panda, just mainline might be another option too..
>
> Thanks, Nicolas!
>
> I'll give it a try with either of those trees and update the recipe
> accordingly.
>
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

