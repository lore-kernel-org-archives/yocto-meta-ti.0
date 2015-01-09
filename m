Return-Path: <gleym-meta-ti@m.gmane.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E90EDE0086E; Fri,  9 Jan 2015 02:37:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00, DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (f.deldegan[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [80.91.229.3 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	*  0.0 DKIM_ADSP_CUSTOM_MED No valid author signature, adsp_override is
	*      CUSTOM_MED
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.9 NML_ADSP_CUSTOM_MED ADSP custom_med hit,
	and not from a mailing list
X-Greylist: delayed 906 seconds by postgrey-1.32 at yocto-www;
	Fri, 09 Jan 2015 02:37:55 PST
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2616E004D6
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 02:37:55 -0800 (PST)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gleym-meta-ti@m.gmane.org>) id 1Y9Wfi-0001KM-S0
	for meta-ti@yoctoproject.org; Fri, 09 Jan 2015 11:20:03 +0100
Received: from 93-58-90-146.ip157.fastwebnet.it ([93.58.90.146])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <meta-ti@yoctoproject.org>; Fri, 09 Jan 2015 11:20:02 +0100
Received: from f.deldegan by 93-58-90-146.ip157.fastwebnet.it with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <meta-ti@yoctoproject.org>; Fri, 09 Jan 2015 11:20:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: meta-ti@yoctoproject.org
From: Francesco Del Degan <f.deldegan@gmail.com>
Date: Fri, 9 Jan 2015 09:58:10 +0000 (UTC)
Message-ID: <loom.20150109T105110-873@post.gmane.org>
References: <20150108172247.1FE43529D3@arago-project.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 93.58.90.146 (Mozilla/5.0 (X11;
	Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu
	Chromium/39.0.2171.65 Chrome/39.0.2171.65 Safari/537.36)
Subject: Re: Denys Dmytriyenko : setup-defconfig: support combined	defconfig with listed config fragments
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
X-List-Received-Date: Fri, 09 Jan 2015 10:37:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Arago Project git <git@...> writes:

> +    config=`cat ${S}/.config | grep config-fragment | cut -d= -f2`
> +    if [ -n "$config" ]
> +    then
> +        configfrags=""
> +        for f in $config
> +        do
> +            # Check if the config fragment is available
> +            if [ ! -e "$f" ]
> +            then
> +                echo "Could not find kernel config fragment $f"
> +                exit 1
> +            else
> +                # Sanitize config fragment files to be relative to 
sources
> +                configfrags+=" ${S}/$f"
> +            fi
> +        done
> +    fi
> +

Hi,

I think that configfrags+="..." here is a bashism. It fails on my builder 
with "configfrags+= ..... not found".

I resolved with configfrags="$configfrags ${S}/$f"

Cheers,
  Francesco



