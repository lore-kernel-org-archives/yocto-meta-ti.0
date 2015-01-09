Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDE1AE00828; Fri,  9 Jan 2015 08:03:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 303E6E0070B
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 08:03:23 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t09G3LmR030389;
	Fri, 9 Jan 2015 10:03:21 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t09G3Lbv020564;
	Fri, 9 Jan 2015 10:03:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 9 Jan 2015 10:03:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t09G3KSr012734;
	Fri, 9 Jan 2015 10:03:20 -0600
Date: Fri, 9 Jan 2015 11:03:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Francesco Del Degan <f.deldegan@gmail.com>
Message-ID: <20150109160320.GK4759@edge>
References: <20150108172247.1FE43529D3@arago-project.org>
	<loom.20150109T105110-873@post.gmane.org>
MIME-Version: 1.0
In-Reply-To: <loom.20150109T105110-873@post.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Denys Dmytriyenko : setup-defconfig: support combined?defconfig with listed config fragments
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
X-List-Received-Date: Fri, 09 Jan 2015 16:03:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 09, 2015 at 09:58:10AM +0000, Francesco Del Degan wrote:
> Arago Project git <git@...> writes:
> 
> > +    config=`cat ${S}/.config | grep config-fragment | cut -d= -f2`
> > +    if [ -n "$config" ]
> > +    then
> > +        configfrags=""
> > +        for f in $config
> > +        do
> > +            # Check if the config fragment is available
> > +            if [ ! -e "$f" ]
> > +            then
> > +                echo "Could not find kernel config fragment $f"
> > +                exit 1
> > +            else
> > +                # Sanitize config fragment files to be relative to 
> sources
> > +                configfrags+=" ${S}/$f"
> > +            fi
> > +        done
> > +    fi
> > +
> 
> Hi,
> 
> I think that configfrags+="..." here is a bashism. It fails on my builder 
> with "configfrags+= ..... not found".
> 
> I resolved with configfrags="$configfrags ${S}/$f"

Thanks. I'll fix it.
There are many more bashisms in other places, so I'm not specifically looking 
for them...

-- 
Denys

