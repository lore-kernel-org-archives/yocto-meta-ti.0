Return-Path: <alexandre.belloni@free-electrons.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B87AFE007C2; Tue, 12 Aug 2014 20:13:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3220E0079A
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 20:13:27 -0700 (PDT)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 3F658975; Wed, 13 Aug 2014 05:13:28 +0200 (CEST)
Received: from localhost (207-191-197-203.cpe.imoncommunications.net
	[207.191.197.203])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 8C2217D9;
	Wed, 13 Aug 2014 05:13:27 +0200 (CEST)
Date: Wed, 13 Aug 2014 05:13:23 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Message-ID: <20140813031323.GA16989@piout.net>
References: <20140812020344.BF28052981@arago-project.org>
	<CAMCfZKFhAVNKZP2X5jATWOWwrtk4TdBK5VADsui+dTWACAHr9g@mail.gmail.com>
	<20140812151419.GF23523@edge> <20140812222101.GB16009@piout.net>
	<CAMCfZKGNewfvERQczxPpEwDYGk21OvdLLPqzvL+BmLFoArsmRQ@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE7320BBDC5@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE7320BBDC5@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"git@arago-project.org" <git@arago-project.org>
Subject: Re: Alexandre Belloni : beaglebone: use the am335x_boneblack u-boot configuration
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
X-List-Received-Date: Wed, 13 Aug 2014 03:13:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I just tested again, out of curiosity.
I'm usinf poky and meta-ti, dora branch. What happens is that "make
am335x_boneblack" is running at do_configure and is actually building
the correct u-boot.

Again, sorry about that breakage.

On 12/08/2014 at 23:03:58 +0000, Dmytriyenko, Denys wrote :
> Same here, it was failing the configure step.
> 
> 
> Sent from my Android phone using TouchDown (www.nitrodesk.com)
> 
> -----Original Message-----
> From: Diego Sueiro [diego.sueiro@gmail.com]
> Received: Tuesday, 12 Aug 2014, 19:03
> To: Alexandre Belloni [alexandre.belloni@free-electrons.com]
> CC: Dmytriyenko, Denys [denys@ti.com]; meta-ti mailing list [meta-ti@yoctoproject.org]; Arago Project git [git@arago-project.org]
> Subject: Re: [meta-ti] Alexandre Belloni : beaglebone: use the am335x_boneblack u-boot configuration
> 
> Hi Alexandre,
> 
> On Tue, Aug 12, 2014 at 7:21 PM, Alexandre Belloni <alexandre.belloni@free-electrons.com<mailto:alexandre.belloni@free-electrons.com>> wrote:
> Hi,
> 
> On 12/08/2014 at 11:14:19 -0400, Denys Dmytriyenko wrote :
> > > > diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> > > > index 8a83a1a..0b4dce3 100644
> > > > --- a/conf/machine/beaglebone.conf
> > > > +++ b/conf/machine/beaglebone.conf
> > > > @@ -11,4 +11,4 @@ IMAGE_FSTYPES += "tar.gz"
> > > >
> > > >  SERIAL_CONSOLE = "115200 ttyO0"
> > > >
> > > > -UBOOT_MACHINE = "am335x_evm_config"
> > > > +UBOOT_MACHINE = "am335x_boneblack"
> > > >
> > >
> > > There is a typo here. Must be "am335x_boneblack_config" instead of
> > > "am335x_boneblack"
> >
> > Goot catch, thanks!
> >
> 
> I tried, both are working. I didn't think that patch would be merged
> that fast, sorry about that.
> 
> It did not worked for me. I had to put "am335x_boneblack_config"
> 
> Regards,
> 
> --
> *dS
> Diego Sueiro
> 
> Administrador do Embarcados
> www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
> 
> /*long live rock 'n roll*/

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

